import React, { useContext, useEffect, useState } from 'react';
import { View, Text, Image, ScrollView, TouchableOpacity } from 'react-native';
import styles from "./UserStyles";
import MyContext from '../../configs/MyContext';
import { Icon } from 'react-native-elements';
import { useNavigation } from '@react-navigation/native';
import API, { endpoints } from "../../configs/API";
import AsyncStorage from '@react-native-async-storage/async-storage';
import { format } from 'date-fns';

export default UserPage = () => {
  const [currentUser] = useContext(MyContext);
  const [store, setStore] = useState(null);
  const [completedOrders, setCompletedOrders] = useState([]);
  const navigation = useNavigation();


  useEffect(() => {
    if (currentUser) {
      const fetchStore = async () => {
        try {
          const response = await API.get(endpoints['store-by-user'].replace('{user_id}', currentUser.id));
          setStore(response.data.results[0]);
        } catch (error) {
          console.error('Error fetching store:', error);
        }
      };

      const fetchCompletedOrders = async () => {
        try {
          const accessToken = await AsyncStorage.getItem('token_access');
          const response = await API.get(endpoints['order-by-user'].replace('{user_id}', currentUser.id), {
            headers: {
              'Authorization': `Bearer ${accessToken}`
            }
          });
          const completedOrders = response.data.filter(order => order.order_status === 'completed');
          setCompletedOrders(completedOrders);
        } catch (error) {
          console.error('Error fetching completed orders:', error);
        }
      };

      fetchStore();
      fetchCompletedOrders();
    }
  }, [currentUser]);

  if (!currentUser) {
    return null;
  }

  const handleNavigateToStore = () => {
    navigation.navigate('Store', { storeId: store.id });
  };

  const renderCompletedOrders = () => {
    return completedOrders.map(order => (
      <TouchableOpacity key={order.id} style={styles.completedOrderItem}>
        {/* Hiển thị thông tin đơn hàng */}
        <Text style={styles.orderTitle}>Order: {format(new Date(order.order_date), 'dd/MM/yyyy HH:mm')}</Text>
        <Text style={styles.orderInfo}>Total Amount: {order.total_amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")} VND</Text>
        {/* Thêm các thông tin khác của đơn hàng nếu cần */}
      </TouchableOpacity>
    ));
  };

  return (
    <ScrollView showsVerticalScrollIndicator={false}>
      <View style={styles.containerUserPage}>
        <Image source={{ uri: currentUser.avatar_url }} style={styles.avatar} />
        <Text style={styles.userFullName}>{currentUser.first_name} {currentUser.last_name}</Text>

        {store && (
          <TouchableOpacity style={styles.storeItem} onPress={handleNavigateToStore}>
            <Image source={{ uri: store.wallpaper_url }} style={styles.miniStoreImage} />
            <Text style={styles.storeName}>{store.store_name}</Text>
          </TouchableOpacity>
        )}

        {/* Hiển thị danh sách các đơn hàng đã hoàn thành */}
        {completedOrders.length > 0 && (
          <View style={styles.completedOrdersContainer}>
            <Text style={styles.completedOrdersTitle}>Completed Orders</Text>
            {renderCompletedOrders()}
          </View>
        )}


      </View>
    </ScrollView>
  );
};
