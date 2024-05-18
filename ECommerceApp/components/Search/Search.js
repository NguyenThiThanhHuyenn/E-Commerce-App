import React, { useEffect, useState } from 'react';
import { View, Text, TextInput, TouchableOpacity } from 'react-native';
import SearchStyles from './SearchStyles';
import { useNavigation } from '@react-navigation/native';
import API, { endpoints } from '../../configs/API';
import { Picker } from '@react-native-picker/picker';


export default SearchScreen = () => {
    const [keyword, setKeyword] = useState('');
    const navigation = useNavigation();
    const [products, setProducts] = useState([]);
    const [sortBy, setSortBy] = useState('product_name');
    const [sortOrder, setSortOrder] = useState('asc');
    const [minPrice, setMinPrice] = useState('');
    const [maxPrice, setMaxPrice] = useState('');
    const [filteredProducts, setFilteredProducts] = useState([]);

    const [productImages, setProductImages] = useState({});

    const fetchProductImages = async (productId) => {
        try {
            const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', productId));
            return productImageResponse.data.results;

        } catch (ex) {
            console.error(ex);
            return [];
        }
    };

    const handleSearch = async () => {
        try {
            const response = await API.get(endpoints.products, {
                params: { search: keyword, ordering: `${sortOrder === 'asc' ? '' : '-'}${sortBy}` },
            });

            setProducts(response.data.results);

            const imagesPromises = response.data.results.map(product => fetchProductImages(product.id));
            const images = await Promise.all(imagesPromises);
            const imagesMap = images.reduce((acc, curr, index) => {
                acc[response.data.results[index].id] = curr.length > 0 ? curr[0] : null;
                return acc;
            }, {});

            setProductImages(imagesMap);

            // Lọc sản phẩm dựa trên khoảng giá
            const filteredProducts = response.data.results.filter(product => {
                if (minPrice && maxPrice) {
                    return product.price >= minPrice && product.price <= maxPrice;
                } else if (minPrice) {
                    return product.price >= minPrice;
                } else if (maxPrice) {
                    return product.price <= maxPrice;
                }
                return true; // Trả về tất cả sản phẩm nếu không có khoảng giá nào được nhập
            });

            setFilteredProducts(filteredProducts); // Cập nhật danh sách sản phẩm đã lọc

            // Chuyển hướng đến màn hình kết quả tìm kiếm
            navigation.navigate('SearchResults', {
                searchQuery: keyword,
                products: filteredProducts, // Chuyển danh sách sản phẩm đã lọc
                productImages: imagesMap
            });

        } catch (error) {
            console.error('Error searching for products:', error);
        }
    };

    return (
        <View style={SearchStyles.container}>
            <TextInput
                style={SearchStyles.input}
                placeholder="Search..."
                onChangeText={(text) => setKeyword(text)}
            />
            <Picker
                selectedValue={sortBy}
                style={SearchStyles.picker}
                onValueChange={(itemValue, itemIndex) => setSortBy(itemValue)}
            >
                <Picker.Item label="Sort by Name" value="product_name" />
                <Picker.Item label="Sort by Price" value="price" />
            </Picker>
            <Picker
                selectedValue={sortOrder}
                style={SearchStyles.picker}
                onValueChange={(itemValue, itemIndex) => setSortOrder(itemValue)}
            >
                <Picker.Item label="Ascending" value="asc" />
                <Picker.Item label="Descending" value="desc" />
            </Picker>

            <TextInput
                style={SearchStyles.input}
                placeholder="Min Price"
                onChangeText={(text) => setMinPrice(text)}
                keyboardType="numeric"
            />
            <TextInput
                style={SearchStyles.input}
                placeholder="Max Price"
                onChangeText={(text) => setMaxPrice(text)}
                keyboardType="numeric"
            />

            <TouchableOpacity style={SearchStyles.searchButton} onPress={() => handleSearch()}>
                <Text style={SearchStyles.searchButtonText}>Search</Text>
            </TouchableOpacity>
        </View>
    );
};
