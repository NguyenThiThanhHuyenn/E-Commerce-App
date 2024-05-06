import React, { useState, useEffect, useContext } from "react";
import { TouchableOpacity, View, Text, Image, ScrollView, useWindowDimensions, Alert } from "react-native";
import PropTypes from 'prop-types';
import Carousel from 'react-native-snap-carousel';
import API, { endpoints } from "../../configs/API";
import styles from './ProductStyles';
import HTML from 'react-native-render-html';
import ReviewComponent from "../Review/ReviewComponent";
import { Icon } from 'react-native-elements';
import { useNavigation } from "@react-navigation/native";
import MyContext from "../../configs/MyContext";
import CreateReviewComponent from "../Review/CreateReviewComponent";
import AsyncStorage from "@react-native-async-storage/async-storage";


const ProductDetail = ({ route }) => {
  const [currentUser] = useContext(MyContext);
  const { product, store } = route.params;
  const windowWidth = useWindowDimensions().width;
  const [productImages, setProductImages] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [averageRating, setAverageRating] = useState(null);
  const [storeName, setStoreName] = useState('');
  const [loading, setLoading] = useState(false);


  const navigation = useNavigation();

  useEffect(() => {
    const fetchProductImages = async () => {
      try {
        const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', product.id));
        setProductImages(productImageResponse.data.results);
        
      } catch (error) {
        console.error(error);
      }
    };
  
    const fetchReviews = async () => {
      try {
        const apiUrl = endpoints['reviews-by-product'].replace('{product_id}', product.id);
        const response = await API.get(apiUrl);
        const reviewsWithUserDetails = await Promise.all(response.data.map(async review => {
          const userResponse = await API.get(`/user/${review.user}/`);
          const userDetails = userResponse.data;
          return { ...review, username: userDetails.username };
        }));
        setReviews(reviewsWithUserDetails);
        const totalRating = reviewsWithUserDetails.length > 0 ? reviewsWithUserDetails.reduce((total, review) => total + review.rating, 0) : 0;
        const avgRating = totalRating / (reviewsWithUserDetails.length || 1);
        setAverageRating(avgRating.toFixed(1));
      } catch (error) {
        console.error(error);
      }
    };

    const fetchStoreName = async () => {
      try {
        const storeResponse = await API.get(endpoints['store'].replace('{store_id}', product.store));
        setStoreName(storeResponse.data.store_name);
        console.info(storeResponse.data.store_name)
      } catch (error) {
        console.error(error);
      }
    };

    fetchProductImages();
    fetchReviews();
    fetchStoreName();
  }, [product.id]);


  const renderItem = ({ item }) => (
    <View style={styles.imageContainer}>
      <Image source={{ uri: item.image_url }} style={styles.image} />
    </View>
  );

  const handleToStore = () => {

    navigation.navigate('Store', { storeId: product.store});
  };


  const handleAddReview = async (reviewData) => {
    try {
      setLoading(true);
      
      const formData = new FormData();
      formData.append('user', currentUser.id); 
      formData.append('product', product.id); 
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
        const newReviewList = [...reviews, newReview];
        setReviews(newReviewList);
        
        const userResponse = await API.get(`/user/${newReview.user}/`);
        const userDetails = userResponse.data;
        
        const updatedReview = { ...newReview, username: userDetails.username };
        const updatedReviewList = [...reviews, updatedReview];
        setReviews(updatedReviewList);
        
        Alert.alert("Success", "Review added successfully");
      }
    } catch (error) {
      console.error('Error adding review:', error);
      Alert.alert('Error', 'Failed to add review. Please try again later.');
    } finally {
      setLoading(false);
    }
  };

  const isStoreOwner = currentUser && currentUser.id && store && store.user.includes(`/user/${currentUser.id}/`);

  
  
  return (
    <ScrollView showsVerticalScrollIndicator={false}>
      <View style={styles.container} >
        <View style={styles.carouselContainer}>
        <Carousel 
          data={productImages}
          renderItem={renderItem}
          sliderWidth={300}
          itemWidth={300}
          loop={true}
          autoplay={true}
          autoplayInterval={3000}
        />
      </View>
      <View style={styles.infoContainer}>
        <Text style={styles.title}>{product.product_name}</Text>
        <TouchableOpacity onPress={() => handleToStore()}><Text style={styles.storeName}><Icon name="storefront-outline" type="ionicon"/> {storeName}</Text></TouchableOpacity>
        <View >
            {isStoreOwner && (
              <View style={styles.buttonForSeller}>
                <TouchableOpacity style={styles.buttonUpdate} onPress={() => navigation.navigate('UpdateProduct', { product: product })}>
                  <Icon name="pencil-outline" type="ionicon"/>
                </TouchableOpacity>
              </View>
            )}
            </View>
        
        {averageRating && (
          <Text style={styles.averageRating}>{averageRating ? `${averageRating}/5.0` : '0.0/5.0'}<Icon  name='star' size={20} type='ionicon' color={'#b89d3b'}/></Text> 
        )}
        
        <ScrollView style={styles.descriptionContainer} showsHorizontalScrollIndicator={false}>
            <View style={styles.descriptionText} numberOfLines={undefined}>
                <HTML source={{ html: product.description }} contentWidth={windowWidth} />
            </View>
        </ScrollView>
        <View style={styles.priceContainer}>
          <Text style={styles.priceText}>{product.price} VND</Text>
        </View>
        <TouchableOpacity style={styles.button}>
          <Text style={styles.buttonText}>Add to Cart</Text>
        </TouchableOpacity>
      </View>
      {/* {console.info('Reviews:', reviews)} */}
      <View>
      <Text style={styles.title}>Customer Reviews</Text>
      {currentUser && <CreateReviewComponent onSubmit={handleAddReview} />}
        {reviews && reviews.length > 0 ? (
          reviews.map((item) => (
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
      </View>
      
    </ScrollView>
  );
};

ProductDetail.propTypes = {
  route: PropTypes.object.isRequired,
};

export default ProductDetail;
