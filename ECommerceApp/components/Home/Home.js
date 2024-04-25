import React, { useState, useEffect } from "react";
import { View, Text, ActivityIndicator, ScrollView, TouchableOpacity, Image, FlatList} from "react-native";
import AppStyles from "../../styles/AppStyles";
import Styles from "./Styles";
import API, { endpoints } from "../../configs/API";

const Home = () => {
    const [categories, setCategories] = useState(null);


    useEffect(() => {
        const loadCategories = async () => {
            try {
                let res = await API.get(endpoints['categories']);
                setCategories(res.data.results);
            } catch (ex) {
                console.error(ex);
            }
        }

        loadCategories();
    }, []);

    // Render a single category item
    const renderCategoryItem = (category) => {
        return (
            <TouchableOpacity key={category.id} style={Styles.categoryItem}>
                <Image source={{ uri: category.imageUrl }} style={Styles.categoryImage} />
                <Text style={Styles.categoryText}>{category.name}</Text>
            </TouchableOpacity>
        );
    };

    return (
        <View style={AppStyles.container}>
            <Text style={AppStyles.subject}>HOME</Text>
            <ScrollView horizontal={true} showsHorizontalScrollIndicator={false}>
                {categories === null ? <ActivityIndicator /> :
                    categories.map(category => renderCategoryItem(category))
                }
            </ScrollView>
        </View>
    );
}

export default Home;
