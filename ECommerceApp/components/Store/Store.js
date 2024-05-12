import React, { useState, useEffect, useContext } from "react";
import { View, Text, Image, ScrollView, TouchableOpacity, Alert } from "react-native";
import PropTypes from 'prop-types';
import API, { endpoints } from "../../configs/API";
import styles from './StoreStyles';
import { Icon } from "react-native-elements";
import ReviewComponent from "../Review/ReviewComponent";
import { useNavigation } from "@react-navigation/native";
import CreateReviewComponent from "../Review/CreateReviewComponent";
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "../../configs/MyContext";


const Store = ({ route }) => {
  const [currentUser] = useContext(MyContext);
  const { storeId } = route.params;
  const [store, setStore] = useState(null);
  const [products, setProducts] = useState([]);
  const [productAverageRating, setProductAverageRating] = useState([]);
  const [storeReviews, setStoreReviews] = useState([]);
  const [storeAverageRating, setStoreAverageRating] = useState(0);
  const navigation = useNavigation();
  const [loading, setLoading] = useState(false);



  const calculateAverageRating = (reviews) => {
    if (!reviews || reviews.length === 0) return 0;
    const totalRating = reviews.reduce((total, review) => total + review.rating, 0);
    return totalRating / reviews.length;
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const storeResponse = await API.get(endpoints.store.replace('{store_id}', storeId));
        setStore(storeResponse.data);

        const storeReviewsResponse = await API.get(endpoints['reviews-by-store'].replace('{store_id}', storeId));
        const reviewsWithUserDetails = await Promise.all(storeReviewsResponse.data.map(async review => {
          const userResponse = await API.get(`/user/${review.user}/`);
          const userDetails = userResponse.data;
          return { ...review, username: userDetails.username };
        }));
        setStoreReviews(reviewsWithUserDetails);

        const storeAverageRating = calculateAverageRating(reviewsWithUserDetails);
        setStoreAverageRating(storeAverageRating);

        const productsResponse = await API.get(endpoints['products-by-store'].replace('{store_id}', storeId));
        const productsData = productsResponse.data.results;

        const productsWithImages = await Promise.all(productsData.map(async (product) => {
          try {
            const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', product.id));
            const productImages = productImageResponse.data.results;

            if (productImages.length > 0) {
              product.image_url = productImages[0].image_url;
            }

            const productReviewsResponse = await API.get(endpoints['reviews-by-product'].replace('{product_id}', product.id));
            const productReviews = productReviewsResponse.data;
            const productAverageRating = calculateAverageRating(productReviews);


            product.averageRating = productAverageRating;

          } catch (error) {
            console.error("Error fetching product data:", error);
          }
          return product;
        }));



        setProducts(productsWithImages);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, [storeId]);



  const isStoreOwner = currentUser && currentUser.id && store && store.user.includes(`/user/${currentUser.id}/`);

  const handleAddReview = async (reviewData) => {
    try {
      setLoading(true);

      const formData = new FormData();
      formData.append('user', currentUser.id);
      formData.append('product', store.id);
      formData.append('rating', reviewData.rating);
      formData.append('comment', reviewData.comment);

      const accessToken = await AsyncStorage.getItem('token_access');

      const response = await API.post(endpoints['review'], formData, {
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Content-Type': 'multipart/form-data'
        }
      });

      if (response.status === 201) {
        const newReview = response.data;
        const newReviewList = [...storeReviews, newReview];
        setStoreReviews(newReviewList);

        const userResponse = await API.get(`/user/${newReview.user}/`);
        const userDetails = userResponse.data;

        const updatedReview = { ...newReview, username: userDetails.username };
        const updatedReviewList = [...storeReviews, updatedReview];
        setStoreReviews(updatedReviewList);

        Alert.alert("Success", "Review added successfully");
      }
    } catch (error) {
      console.error('Error adding review:', error);
      Alert.alert('Error', 'Failed to add review. Please try again later.');
    } finally {
      setLoading(false);
    }
  };

  const handleAddProduct = () => {
    navigation.navigate('AddProduct', { storeId: storeId });
  };

  const handleDeleteProduct = async (productId) => {
    try {
      // Gửi request lên API để xóa sản phẩm
      const accessToken = await AsyncStorage.getItem('token_access');
      const response = await API.delete(endpoints['/products/{product_id}/'].replace('{product_id}', productId), {
        headers: {
          'Authorization': `Bearer ${accessToken}`
        }
      });

      if (response.status === 204) {
        // Xóa sản phẩm thành công, cập nhật danh sách sản phẩm
        const updatedProducts = products.filter(product => product.id !== productId);
        setProducts(updatedProducts);
        Alert.alert('Success', 'Product deleted successfully');
      }
    } catch (error) {
      console.error('Error deleting product:', error);
      Alert.alert('Error', 'Failed to delete product. Please try again later.');
    }
  };



  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {store && (
        <View style={styles.storeInfoContainer}>
          <Image source={{ uri: store.wallpaper_url }} style={styles.storeWallpaper} />
          <View style={styles.storeHeader}>
            <Text style={styles.storeName}>{store.store_name}</Text>
            <View >
              {isStoreOwner && (
                <View style={styles.buttonForSeller}>
                  <TouchableOpacity style={styles.buttonUpdate} onPress={() => navigation.navigate('UpdateStore', { storeId: storeId })}>
                    <Icon name="pencil-outline" type="ionicon" />
                  </TouchableOpacity>
                  <TouchableOpacity style={styles.buttonUpdate} onPress={() => navigation.navigate('Stats')}>
                    <Icon name="stats-chart-outline" type="ionicon" />
                  </TouchableOpacity>
                </View>
              )}
            </View>
          </View>
          <View style={styles.storeInfo} >
            <View>
              <Text style={styles.storeAverageRating}>
                Rating: {storeAverageRating.toFixed(1)}/5.0
              </Text>
              <Text style={styles.storeDescription}>{store.description}</Text>
            </View>
          </View>
        </View>
      )}

      <View style={styles.productsContainer}>
        <View style={styles.headerProductList}>
          <Text style={styles.productsTitle}>Products</Text>
          {isStoreOwner && (
            <View style={styles.buttonAddProduct}>
              <TouchableOpacity style={styles.button} onPress={handleAddProduct}>
                <Icon name="add-outline" type="ionicon" size={25} />
              </TouchableOpacity>
            </View>
          )}
        </View>
        {products.map((product) => (
          <View key={product.id} >
            <TouchableOpacity onPress={() => navigation.navigate('ProductDetail', { product: product })} onLongPress={() => handleDeleteProduct(product.id)}>
              <View style={styles.productItem}>
                <Image source={{ uri: product.image_url }} style={styles.productImage} />
                <View style={styles.productInfo}>
                  <Text style={styles.productName}>{product.product_name}</Text>
                  <Text style={styles.productPrice}>{product.price} VND</Text>
                  <Text style={styles.productAverageRating}>
                    {product.averageRating.toFixed(1)}/5.0<Icon name='star' size={20} type='ionicon' color={'#b89d3b'} />
                  </Text>
                </View>
              </View></TouchableOpacity>
          </View>
        ))}
      </View>

      <View>
        <Text style={styles.title}>Reviews</Text>
        {currentUser && <CreateReviewComponent onSubmit={handleAddReview} />}
        {storeReviews && storeReviews.length > 0 ? (
          storeReviews.map((item) => (
            <ReviewComponent
              key={item.id}
              username={item.username}
              rating={item.rating}
              comment={item.comment}
              created_at={item.created_at}
            />
          ))
        ) : (
          <Text>No reviews available</Text>
        )}
      </View>
    </ScrollView>
  );
};

Store.propTypes = {
  route: PropTypes.object.isRequired,
};

export default Store;
