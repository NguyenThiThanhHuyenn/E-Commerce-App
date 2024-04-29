import React, { useState, useEffect } from "react";
import { View, Text, TouchableOpacity, Image, FlatList, Button } from "react-native";
import AppStyles from "../../styles/AppStyles";
import Styles from "./Styles";
import API, { endpoints } from "../../configs/API";

import { useNavigation } from "@react-navigation/native";



const HomeScreen = () => {
    const [categories, setCategories] = useState(null);
    const [products, setProducts] = useState(null);
    const [productImages, setProductImages] = useState({});
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [nextPageUrl, setNextPageUrl] = useState(null);
    const productsPerPage = 20;

    useEffect(() => {
        const fetchData = async () => {
            try {
                const categoriesResponse = await API.get(endpoints['categories']);
                setCategories(categoriesResponse.data.results);
                

                const productsResponse = await API.get(endpoints['products'], { 
                    params: { 
                        limit: productsPerPage, 
                        offset: (currentPage - 1) * productsPerPage 
                    }
                });
                setProducts(productsResponse.data.results);
                setTotalPages(Math.ceil(productsResponse.data.count / productsPerPage));
                setNextPageUrl(productsResponse.data.next);
                console.log("Debug: " + productsResponse.data.next);
    
                const imagesPromises = productsResponse.data.results.map(product => fetchProductImages(product.id));
                const images = await Promise.all(imagesPromises);
                const imagesMap = images.reduce((acc, curr, index) => {
                    acc[productsResponse.data.results[index].id] = curr.length > 0 ? curr[0] : null;
                    return acc;
                }, {});
                setProductImages(imagesMap);
            } catch (ex) {
                console.error(ex);
            }
        };
    
        fetchData();
    }, []);



    const handleNextPage = async () => {
        if (nextPageUrl) {
            try {
                const productsResponse = await API.get(nextPageUrl);
                setProducts(productsResponse.data.results);
                setTotalPages(Math.ceil(productsResponse.data.count / productsPerPage));
                setNextPageUrl(productsResponse.data.next);
    
                // Cập nhật dữ liệu hình ảnh cho các sản phẩm mới
                const imagesPromises = productsResponse.data.results.map(product => fetchProductImages(product.id));
                const images = await Promise.all(imagesPromises);
                const imagesMap = images.reduce((acc, curr, index) => {
                    acc[productsResponse.data.results[index].id] = curr.length > 0 ? curr[0] : null;
                    return acc;
                }, {});
                setProductImages(prevImages => ({ ...prevImages, ...imagesMap })); 
                setCurrentPage(prevPage => prevPage + 1); 
            } catch (ex) {
                console.error(ex);
            }
        }
    };
    
    const handlePreviousPage = async () => {
        if (currentPage > 1) {
            const previousPage = currentPage - 1;
            console.log('Previous Page:', previousPage);
            try {
                const productsResponse = await API.get(endpoints['products'], { 
                    params: { 
                        limit: productsPerPage, 
                        offset: (previousPage - 1) * productsPerPage 
                    }
                });
                setProducts(productsResponse.data.results);
                setTotalPages(Math.ceil(productsResponse.data.count / productsPerPage));
                setNextPageUrl(productsResponse.data.next);
    
                // Cập nhật dữ liệu hình ảnh cho các sản phẩm mới
                const imagesPromises = productsResponse.data.results.map(product => fetchProductImages(product.id));
                const images = await Promise.all(imagesPromises);
                const imagesMap = images.reduce((acc, curr, index) => {
                    acc[productsResponse.data.results[index].id] = curr.length > 0 ? curr[0] : null;
                    return acc;
                }, {});
                setProductImages(prevImages => ({ ...prevImages, ...imagesMap })); 
                setCurrentPage(previousPage); 
            } catch (ex) {
                console.error(ex);
            }
        }
    };
    
    
    
    const handleGoToPage = async (pageNumber) => {
        if (pageNumber >= 1 && pageNumber <= totalPages) {
            console.log('Go to Page:', pageNumber);
            try {
                const productsResponse = await API.get(endpoints['products'], { 
                    params: { 
                        limit: productsPerPage, 
                        offset: (pageNumber - 1) * productsPerPage 
                    }
                });
                setProducts(productsResponse.data.results);
                setTotalPages(Math.ceil(productsResponse.data.count / productsPerPage));
                setNextPageUrl(productsResponse.data.next);
    
                // Cập nhật dữ liệu hình ảnh cho các sản phẩm mới
                const imagesPromises = productsResponse.data.results.map(product => fetchProductImages(product.id));
                const images = await Promise.all(imagesPromises);
                const imagesMap = images.reduce((acc, curr, index) => {
                    acc[productsResponse.data.results[index].id] = curr.length > 0 ? curr[0] : null;
                    return acc;
                }, {});
                setProductImages(imagesMap); 
                setCurrentPage(pageNumber); 
            } catch (ex) {
                console.error(ex);
            }
        }
    };
    
    

    const fetchProductImages = async (productId) => {
        try {
            const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', productId));
            // console.log("DEBUG: " + productImageResponse.config.url);
            return productImageResponse.data.results;
            
        } catch (ex) {
            console.error(ex);
            return [];
        }
    };

    const renderCategoryItem = (category) => {
        return (
            <TouchableOpacity key={category.id} style={Styles.categoryItem}>
                <Image source={{ uri: category.image }} style={Styles.categoryImage} />
                <Text style={Styles.categoryText}>{category.name}</Text>
            </TouchableOpacity>
        );
    };

    const navigation = useNavigation();
    const renderProductItem = ({ item }) => {
        console.log('Rendering Product Item:', item.id);
        const productImage = productImages[item.id];
        
        if (!productImage) {
            return null; 
        }

        const imageUrl = productImage.image;

        return (
            <TouchableOpacity key={item.id} style={AppStyles.container} onPress={() => navigation.navigate('ProductDetail', { product: item })}>
                <Image source={{ uri: imageUrl }} style={AppStyles.images} />
                <Text style={AppStyles.productName}>{item.product_name}</Text>
                <Text style={AppStyles.price}>{item.price}</Text>
            </TouchableOpacity>
        );
    };

    const MAX_BUTTONS = 5; 

    const calculatePaginationRange = () => {
        let start = Math.max(1, currentPage - Math.floor(MAX_BUTTONS / 2));
        let end = Math.min(totalPages, start + MAX_BUTTONS - 1);
        
        if (end - start + 1 < MAX_BUTTONS) {
            end = Math.min(totalPages, start + MAX_BUTTONS - 1); 
            start = Math.max(1, end - MAX_BUTTONS + 1); 
        }
    
        return { start, end };
    };
    
    const renderPaginationButtons = () => {
        const { start, end } = calculatePaginationRange();
    
        const buttons = [];
    
        // Nút Previous
        if (currentPage > 1) {
            buttons.push(
                <TouchableOpacity
                    key="prev"
                    style={Styles.paginationButtons}
                    onPress={handlePreviousPage}
                >
                    <Text style={Styles.paginationText}>Previous</Text>
                </TouchableOpacity>
            );
        }
        // Nút "..." đại diện cho các trang trước
        if (start > 1) {
            buttons.push(
                <TouchableOpacity key="startDots" style={Styles.paginationButtons}>
                    <Text style={Styles.paginationText}>...</Text>
                </TouchableOpacity>
            );
        }

        // Các nút phân trang trong phạm vi đã tính toán
        for (let i = start; i <= end; i++) {
            buttons.push(
                <TouchableOpacity
                    key={i}
                    style={[Styles.paginationButtons, i === currentPage ? Styles.activeButton : null]}
                    onPress={() => handleGoToPage(i)}
                >
                    <Text style={Styles.paginationText}>{i.toString()}</Text>
                </TouchableOpacity>
            );
        }
    
        // Nút "..." đại diện cho các trang sau
        if (end < totalPages) {
            buttons.push(
                <TouchableOpacity key="endDots" style={Styles.paginationButtons}>
                    <Text style={Styles.paginationText}>...</Text>
                </TouchableOpacity>
            );
        }
    
        // Nút Next
        if (currentPage < totalPages) {
            buttons.push(
                <TouchableOpacity
                    key="next"
                    style={Styles.paginationButtons}
                    onPress={handleNextPage}
                >
                    <Text style={Styles.paginationText}>Next</Text>
                </TouchableOpacity>
            );
        }
    
        return buttons;
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

            {AppStyles != undefined && <FlatList
                key="productsFlatList"
                showsVerticalScrollIndicator={false}
                data={products}
                renderItem={renderProductItem}
                keyExtractor={(item) => item.id.toString()}
                numColumns={2}
            />}

            <View style={{ flexDirection: 'row', justifyContent: 'center' }}>
                {renderPaginationButtons()}
            </View>
        </View>
    );
};

export default HomeScreen;
