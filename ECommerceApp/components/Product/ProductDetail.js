import React, { useState, useEffect } from "react";
import { TouchableOpacity, View, Text, Image, ScrollView, useWindowDimensions } from "react-native";
import PropTypes from 'prop-types';
import Carousel from 'react-native-snap-carousel';
import API, { endpoints } from "../../configs/API";
import styles from './ProductStyles';
import HTML from 'react-native-render-html';
import ReviewComponent from "../Review/ReviewComponent";
import { Icon } from "react-native-elements";

const ProductDetail = ({ route }) => {
  const { product } = route.params;
  const windowWidth = useWindowDimensions().width;
  const [productImages, setProductImages] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [averageRating, setAverageRating] = useState(null);

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
        console.log('API URL:', apiUrl); 
        const response = await API.get(apiUrl);
        const reviewsWithUserDetails = await Promise.all(response.data.map(async review => {
          const userResponse = await API.get(`/user/${review.user}/`);
          const userDetails = userResponse.data;
          return { ...review, username: userDetails.username };
        }));
        setReviews(reviewsWithUserDetails);
        console.info(response.data);
        const totalRating = reviewsWithUserDetails.reduce((total, review) => total + review.rating, 0);
        const avgRating = totalRating / reviewsWithUserDetails.length;
        setAverageRating(avgRating.toFixed(1));
      } catch (error) {
        console.error(error);
      }
    };

    fetchProductImages();
    fetchReviews();
  }, [product.id]);

  const renderItem = ({ item }) => (
    <View style={styles.imageContainer}>
      <Image source={{ uri: item.image }} style={styles.image} />
    </View>
  );

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
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
        {averageRating && (
          <Text style={styles.averageRating}>{averageRating}/5.0 <Icon  name='star' size={20} type='ionicon' color={'#b89d3b'}/></Text>
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
      {console.info('Reviews:', reviews)}
      <View>
      <Text style={styles.title}>Customer Reviews</Text>
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
    </ScrollView>
  );
};

ProductDetail.propTypes = {
  route: PropTypes.object.isRequired,
};

export default ProductDetail;
