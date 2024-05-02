import React from 'react';
import { View, Text, TouchableOpacity, FlatList, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AppStyles from '../../styles/AppStyles';
import ProductStyles from './ProductStyles';

const ProductByCategory = ({ route }) => {
    const navigation = useNavigation();
    const { category, products} = route.params;

    const renderProductItem = ({ item }) => (
        <TouchableOpacity style={AppStyles.container} onPress={() => navigation.navigate('ProductDetail', { product: item })}>
            <Image style={AppStyles.images} source={{ uri: item.image }} />
            <Text style={AppStyles.productName}>{item.product_name}</Text>
            <Text style={AppStyles.price}>{item.price}</Text>
        </TouchableOpacity>
    );

    console.log('Category URL:', category.image);

    return (
        <View style={{ flex: 1 }}>
            <Image source={{ uri: category.image }} style={ProductStyles.categoryBanner}/>
            <FlatList
                key="productsFlatList"
                showsVerticalScrollIndicator={false}
                data={products}
                renderItem={renderProductItem}
                keyExtractor={(item) => item.id.toString()}
                numColumns={2}
                style={{ backgroundColor: 'white' }}
            />
        </View>
    );
};

export default ProductByCategory;
