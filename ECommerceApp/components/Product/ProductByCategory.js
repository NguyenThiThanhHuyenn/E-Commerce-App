import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, FlatList, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import API, { endpoints } from "../../configs/API";
import AppStyles from '../../styles/AppStyles';
import ProductStyles from './ProductStyles';

const ProductByCategory = ({ route }) => {
    const navigation = useNavigation();
    const { category, products } = route.params;
    const [productImages, setProductImages] = useState({});

    useEffect(() => {
        const fetchProductImages = async () => {
            const imagesPromises = products.map(async (product) => {
                try {
                    const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', product.id));
                    const productImages = productImageResponse.data.results;
                    // Lấy ảnh đầu tiên từ danh sách ảnh và gán vào product
                    if (productImages.length > 0) {
                        return { productId: product.id, image: productImages[0].image };
                    } else {
                        return { productId: product.id, image: null };
                    }
                } catch (error) {
                    console.error("Error fetching product images:", error);
                    return { productId: product.id, image: null };
                }
            });
            const images = await Promise.all(imagesPromises);
            const imagesMap = images.reduce((acc, curr) => {
                acc[curr.productId] = curr.image;
                return acc;
            }, {});
            setProductImages(imagesMap);
        };

        fetchProductImages();
    }, [products]);

    const renderProductItem = ({ item }) => {
        const imageUrl = productImages[item.id];

        return (
            <TouchableOpacity style={AppStyles.container} onPress={() => navigation.navigate('ProductDetail', { product: item })}>
                <Image style={AppStyles.images} source={{ uri: imageUrl }} />
                <Text style={AppStyles.productName}>{item.product_name}</Text>
                <Text style={AppStyles.price}>{item.price}</Text>
            </TouchableOpacity>
        );
    };

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
