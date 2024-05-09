import React, { useState, useContext, useEffect, useMemo } from 'react';
import { View, Text, TouchableOpacity, FlatList, Alert } from 'react-native';
import styles from './Styles';
import API, { endpoints } from '../../configs/API';
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "../../configs/MyContext";
import { Picker } from '@react-native-picker/picker';

export default CartScreen = ({ navigation, route }) => {
    const [currentUser] = useContext(MyContext);
    const [orderDetails, setOrderDetails] = useState([]);
    const [paymentMethod, setPaymentMethod] = useState('cash_on_delivery');

    const fetchCart = async () => {
        try {
            const accessToken = await AsyncStorage.getItem('token_access');
            const response = await API.get(endpoints['pending-order-details'].replace('{user_id}', currentUser.id), {
                headers: {
                    'Authorization': `Bearer ${accessToken}`
                }
            });
            setOrderDetails(response.data);
        } catch (error) {
            console.error('Error fetching cart:', error);
            Alert.alert('Error', 'Failed to fetch cart. Please try again later.');
        }
    };

    useEffect(() => {
        fetchCart();
    }, []);

    const removeItem = async (id) => {
        try {
            const accessToken = await AsyncStorage.getItem('token_access');
            const response = await API.delete(endpoints['remove-order-detail'].replace('{id}', id), {
                headers: {
                    'Authorization': `Bearer ${accessToken}`
                }
            });
            if (response.status === 204) {
                const deletedOrderDetail = orderDetails.find(item => item.id === id);
                const updatedOrderDetails = orderDetails.filter(item => item.id !== id);
                setOrderDetails(updatedOrderDetails);
    
                Alert.alert('Success', 'Item removed from cart successfully.');
            }
        } catch (error) {
            console.error('Error removing item from cart:', error);
            Alert.alert('Error', 'Failed to remove item from cart. Please try again later.');
        }
    };
    
    const calculateTotal = useMemo(() => {
        let total = 0;
        if (Array.isArray(orderDetails)) {
            orderDetails.forEach(item => {
                const subtotal = item.price * item.quantity;
                total += subtotal;
            });
        }
        return total;
    }, [orderDetails]);

    const placeOrder = async () => {
        try {
            const accessToken = await AsyncStorage.getItem('token_access');
               
            // Duyệt qua từng order detail và gửi yêu cầu thanh toán cho từng order
            for (const orderDetail of orderDetails) {
                const formData = new FormData();
                formData.append('order', orderDetail.order);
                formData.append('amount', calculateTotal);
                formData.append('payment_method', paymentMethod);
                formData.append('transaction_id', '000000');

                console.log(formData)
    
                // Gửi yêu cầu API thanh toán
                const response = await API.post(endpoints['create-payment'], formData, {
                    headers: {
                        'Authorization': `Bearer ${accessToken}`,
                        'Content-Type': 'multipart/form-data',
                    },
                });
    
                if (response.status === 201) {
                    console.log('Payment successful:', response.data);
                    // Hiển thị thông báo
                    Alert.alert('Success', 'Your order has been placed successfully.');

                    // Chuyển hướng tới trang UserPage
                    navigation.navigate('UserPage');

                    // Cập nhật trạng thái của các đơn hàng đã thanh toán thành "completed"
                    await updateOrderStatus(orderDetail.order);
                } else {
                    throw new Error('Payment failed');
                }
            }
        } catch (error) {
            Alert.alert('Error', 'Failed to place orders. Please try again later.');
        }
          };


          const updateOrderStatus = async (orderId) => {
            try {
                const accessToken = await AsyncStorage.getItem('token_access');
        
                const formData = new FormData();
                formData.append('order_status', 'completed');
        
                const response = await API.patch(endpoints['patch-order'].replace('{id}',orderId), formData, {
                    headers: {
                        'Authorization': `Bearer ${accessToken}`,
                        'Content-Type': 'multipart/form-data'
                    }
                });
        
                if (response.status === 200) {
                    console.log('Order status updated successfully:', response.data);
                } else {
                    throw new Error('Failed to update order status');
                }
            } catch (error) {
                console.error('Error updating order status:', error);
            }
        };
        
            

    const renderOrderItem = ({ item }) => (
        <TouchableOpacity
            style={styles.listItem}
            onLongPress={() => removeItem(item.id)}
        >
            <View style={styles.productContainer}>
                {item.product_name && (
                    <Text style={styles.productName}>Product: {item.product_name.product_name}</Text>
                )}
                <Text style={styles.quantity}>Quantity: {item.quantity}</Text>
                <Text style={styles.price}>Price: {item.price} VND</Text>
                <Text style={styles.note}>Note: {item.note}</Text>
            </View>
        </TouchableOpacity>
    );

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Cart</Text>
            <View style={styles.userInfoContainer}>
                <Text style={styles.userInfoName}>{currentUser.first_name} {currentUser.last_name}</Text>
                <Text style={styles.userInfo}>{currentUser.email}</Text>
                <Text style={styles.userInfo}>{currentUser.phone_number}</Text>
                <Text style={styles.userInfo}>{currentUser.address}</Text>
            </View>
            {orderDetails.length > 0 ? (
                <FlatList
                    showsVerticalScrollIndicator={false}
                    data={orderDetails}
                    keyExtractor={(item) => item.id.toString()}
                    renderItem={renderOrderItem}
                />
            ) : (
                <Text style={styles.emptyCartText}>Your cart is empty</Text>
            )}
            <View style={styles.paymentContainer}>
                <Text style={styles.paymentLabel}>Payment Method:</Text>
                <Picker
                    selectedValue={paymentMethod}
                    style={styles.paymentPicker}
                    onValueChange={(itemValue, itemIndex) =>
                        setPaymentMethod(itemValue)
                    }>
                    <Picker.Item label="Cash on Delivery" value="cash_on_delivery" />
                    <Picker.Item label="Paypal" value="paypal" />
                    <Picker.Item label="Stripe" value="stripe" />
                    <Picker.Item label="ZaloPay" value="zalopay" />
                    <Picker.Item label="MoMo" value="momo" />
                </Picker>
            </View>
            <Text style={styles.totalText}>Total: {calculateTotal} VND</Text>
            <TouchableOpacity
                style={styles.placeOrderButton}
                onPress={placeOrder} 
            >
                <Text style={styles.placeOrderButtonText}>Place Order</Text>
            </TouchableOpacity>
        </View>
    );
};
