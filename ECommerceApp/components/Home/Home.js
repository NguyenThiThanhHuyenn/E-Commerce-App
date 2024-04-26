import React, { useState, useEffect } from "react";
import { View, Text, ActivityIndicator, TouchableOpacity, Image, FlatList } from "react-native";
import AppStyles from "../../styles/AppStyles";
import Styles from "./Styles";
import API, { endpoints } from "../../configs/API";

const Home = () => {
    const [categories, setCategories] = useState(null);
    const [products, setProducts] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const categoriesResponse = await API.get(endpoints['categories']);
                setCategories(categoriesResponse.data.results);
                console.log(categoriesResponse.data.results);
                console.log("Request URL:", categoriesResponse.config.url); // In ra URL
                console.log("Request headers:", categoriesResponse.config.headers); // In ra headers
                console.log("Response status:", categoriesResponse.status); // In ra status code
                


                const productsResponse = await API.get(endpoints['products']);
                setProducts(productsResponse.data.results);
                console.log(productsResponse.data.results);
                console.log("Request URL:", productsResponse.config.url); // In ra URL
                console.log("Request headers:", productsResponse.config.headers); // In ra headers
                console.log("Response status:", productsResponse.status); // In ra status code
                
            } catch (ex) {
                console.error(ex);
            }
        };

        fetchData();
    }, []);

    const renderCategoryItem = (category) => {
        return (
            <TouchableOpacity key={category.id} style={Styles.categoryItem}>
                <Image source={{ uri: category.image }} style={Styles.categoryImage} />
                <Text style={Styles.categoryText}>{category.name}</Text>
            </TouchableOpacity>
        );
    };

    const renderProductItem = ({ item }) => {
        return (
            <TouchableOpacity key={item.id} style={AppStyles.ProductCard.container}>
                {/* <Image source={{ uri: item.image }} style={AppStyles.ProductCard.images} /> */}
                <Text style={AppStyles.ProductCard.productName}>{item.product_name}</Text>
                <Text style={AppStyles.ProductCard.price}>{item.price}</Text>
            </TouchableOpacity>
        );
    };

    return (
        <View style={{ flex: 1 }}>
            <FlatList
                horizontal
                showsHorizontalScrollIndicator={false}
                data={categories}
                renderItem={({ item }) => renderCategoryItem(item)}
                keyExtractor={(item) => item.id.toString()}
            />

            <FlatList
                data={products}
                renderItem={renderProductItem}
                keyExtractor={(item) => item.id.toString()}
                numColumns={2}
            />
        </View>
    );
};

export default Home;
