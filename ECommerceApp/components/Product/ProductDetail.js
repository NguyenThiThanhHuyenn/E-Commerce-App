import React, { useState, useEffect, useContext } from "react";
import { TouchableOpacity, View, Text, Image, ScrollView, useWindowDimensions, Alert, TextInput } from "react-native";
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
import ProductVariants from "./ProductVariant";


const ProductDetail = ({ route }) => {
  const [currentUser] = useContext(MyContext);
  const { product, store } = route.params;
  const windowWidth = useWindowDimensions().width;
  const [productImages, setProductImages] = useState([]);
  const [productVariants, setProductVariants] = useState([]);
  const [selectedVariants, setSelectedVariants] = useState([]);
  const [quantity, setQuantity] = useState(0);
  const [reviews, setReviews] = useState([]);
  const [averageRating, setAverageRating] = useState(null);
  const [storeName, setStoreName] = useState('');
  const [similarProducts, setSimilarProducts] = useState([]);
  const [similarProductImages, setSimilarProductImages] = useState([]);
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

    const getProductVariantsByProduct = async () => {
      try {
        const response = await API.get(endpoints['productvariants-by-product'].replace('{product_id}', product.id));
        setProductVariants(response.data.results)
        console.log(response.data.results)
      } catch (error) {
        console.error('Error fetching product variants:', error);
        throw error;
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
    const fetchSimilarProducts = async () => {
      try {
        const similarProductsResponse = await API.get(endpoints['similar-products'].replace('{product_id}', product.id));
        setSimilarProducts(similarProductsResponse.data);

        const imagesPromises = similarProductsResponse.data.map(async (similarProduct) => {
          try {
            const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', similarProduct.id));
            const productImages = productImageResponse.data.results;
            if (productImages.length > 0) {
              return productImages[0].image_url;
            } else {
              return null;
            }
          } catch (error) {
            console.error('Error fetching similar product image:', error);
            return null;
          }
        });

        // Chờ cho tất cả các promise hoàn thành và cập nhật state
        const similarProductImages = await Promise.all(imagesPromises);
        setSimilarProductImages(similarProductImages);
      } catch (error) {
        console.error('Error fetching similar products:', error);
      }
    };

    fetchProductImages();
    fetchReviews();
    fetchStoreName();
    fetchSimilarProducts();
    getProductVariantsByProduct();
  }, [product.id]);


  const renderItem = ({ item }) => (
    <View style={styles.imageContainer}>
      <Image source={{ uri: item.image_url }} style={styles.image} />
    </View>
  );

  const handleToStore = () => {

    navigation.navigate('Store', { storeId: product.store });
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


  const handleVariantSelection = (variant) => {
    const updatedVariants = [...selectedVariants];
    const index = updatedVariants.findIndex((v) => v.id === variant.id);
    if (index !== -1) {
      updatedVariants.splice(index, 1);
    } else {
      updatedVariants.push(variant);
    }
    setSelectedVariants(updatedVariants);
    console.log(selectedVariants)
  };



  const handleQuantityChange = (value) => {
    if (!isNaN(value) && parseInt(value) >= 0) {
      setQuantity(parseInt(value));
    } else {
      setQuantity(0);
    }
  };

  const handleAddToCart = async () => {
    try {
      if (!currentUser || !currentUser.id) {
        Alert.alert("Login Required", "Please login to continue.");
        return;
      }

      console.log("JSON:" + JSON.stringify(selectedVariants))
      const formattedNote = JSON.stringify(selectedVariants)
        .replace(/"color":null/g, '')
        .replace(/"size":null/g, '')
        .replace(/"size":/g, '')
        .replace(/"color":/g, '')
        .replace(/{/g, '')
        .replace(/}/g, '')
        .replace(/"id":\d+,?/g, '')
        .replace(/"product_id":\d+,?/g, '')
        .replace(/"null"/g, '')
        .replace(/""/g, '')
        .replace(/(\[\]|\{\})/g, '')
        .replace(/,,/g, ',')
        .replace(/,{2,}/g, ', ')
        .replace(/^\[|\]$/g, '')
        .trim();



      const accessToken = await AsyncStorage.getItem('token_access');
      const existingOrderResponse = await API.get(endpoints['order-by-user'].replace('{user_id}', currentUser.id), {
        headers: {
          'Authorization': `Bearer ${accessToken}`
        }
      });
      const existingOrders = existingOrderResponse.data;
      const existingOrder = existingOrders.find(order => order.store === product.store && order.order_status === 'pending');

      if (existingOrder) {

        const formData = new FormData();
        formData.append('order', existingOrder.id);
        formData.append('store', product.store);
        formData.append('product', product.id);
        formData.append('quantity', quantity);
        formData.append('price', product.price);
        formData.append('note', formattedNote);

        console.log(formData)

        const accessToken = await AsyncStorage.getItem('token_access');
        const response = await API.post(endpoints['order-detail'], formData, {
          headers: {
            'Authorization': `Bearer ${accessToken}`,
            'Content-Type': 'multipart/form-data'
          },
        });


        const patchOrder = new FormData();
        patchOrder.append('total_amount', product.price * quantity);


        console.log(formData)

        const accessToken2 = await AsyncStorage.getItem('token_access');
        const response2 = await API.patch(endpoints['update-order'].replace('{id}', existingOrder.id), patchOrder, {
          headers: {
            'Authorization': `Bearer ${accessToken2}`,
            'Content-Type': 'multipart/form-data'
          },
        });


        if (response.status === 201) {
          Alert.alert('Success', 'Product added to cart successfully');
          navigation.navigate('Cart');
        } else {
          throw new Error('Failed to create order detail');
        }

      } else {
        const formData = new FormData();
        formData.append('user', currentUser.id);
        formData.append('store', product.store);
        formData.append('order_date', new Date().toISOString());
        formData.append('total_amount', product.price * quantity);
        formData.append('payment_method', 'cash_on_delivery');
        formData.append('order_status', 'pending');

        const accessToken = await AsyncStorage.getItem('token_access');
        const response = await API.post(endpoints['create-order'], formData, {
          headers: {
            'Authorization': `Bearer ${accessToken}`,
            'Content-Type': 'multipart/form-data'
          },
        });

        if (response.status === 201) {
          // Sau khi tạo Order mới, thêm Order Detail vào Order đó
          const newOrder = response.data;
          const orderDetailFormData = new FormData();
          orderDetailFormData.append('order', newOrder.id);
          orderDetailFormData.append('store', product.store);
          orderDetailFormData.append('product', product.id);
          orderDetailFormData.append('quantity', quantity);
          orderDetailFormData.append('price', product.price);
          orderDetailFormData.append('note', formattedNote);

          const orderDetailResponse = await API.post(endpoints['order-detail'], orderDetailFormData, {
            headers: {
              'Authorization': `Bearer ${accessToken}`,
              'Content-Type': 'multipart/form-data'
            },
          });

          if (orderDetailResponse.status !== 201) {
            throw new Error('Failed to create order detail');
          }
        } else {
          throw new Error('Failed to create order');
        }
      }

      Alert.alert('Success', 'Product added to cart successfully');
      navigation.navigate('Cart');

    } catch (error) {
      Alert.alert('Error', error.message);
      console.error('Error:', error);
      console.error('Error response:', error.response);
      console.error('Error details:', error.response?.status, error.response?.data);
    }
  };


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
          <TouchableOpacity onPress={() => handleToStore()}><Text style={styles.storeName}><Icon name="storefront-outline" type="ionicon" /> {storeName}</Text></TouchableOpacity>
          <View >
            {isStoreOwner && (
              <View style={styles.buttonForSeller}>
                <TouchableOpacity style={styles.buttonUpdate} onPress={() => navigation.navigate('UpdateProduct', { product: product })}>
                  <Icon name="pencil-outline" type="ionicon" />
                </TouchableOpacity>
              </View>
            )}
          </View>

          {averageRating && (
            <Text style={styles.averageRating}>{averageRating ? `${averageRating}/5.0` : '0.0/5.0'}<Icon name='star' size={20} type='ionicon' color={'#b89d3b'} /></Text>
          )}

          <ScrollView style={styles.descriptionContainer} showsHorizontalScrollIndicator={false}>
            <View style={styles.descriptionText} numberOfLines={undefined}>
              <HTML source={{ html: product.description }} contentWidth={windowWidth} />
            </View>
          </ScrollView>
          <View style={styles.priceContainer}>
            <Text style={styles.priceText}>{product.price} VND</Text>
          </View>
          <View>
            {productVariants && productVariants.length > 0 && (
              <ProductVariants variants={productVariants} onVariantSelect={(variant) => handleVariantSelection(variant)} />)}
          </View>
          <View style={styles.quantityContainer}>
            <Text style={styles.quantityText}>Quantity:</Text>
            <TextInput
              style={styles.quantityInput}
              keyboardType="numeric"
              value={quantity === 0 ? '' : quantity.toString()}
              onChangeText={handleQuantityChange}
            />
          </View>
          <TouchableOpacity style={styles.button} onPress={handleAddToCart}>
            <Text style={styles.buttonText}>Add to Cart</Text>
          </TouchableOpacity>
        </View>
        <View style={styles.similarProductsContainer}>
          <Text style={styles.similarProductsTitle}>Similar Products</Text>
          <ScrollView horizontal={true} showsHorizontalScrollIndicator={false}>
            {similarProducts && similarProducts.map((similarProduct, index) => (
              <TouchableOpacity key={similarProduct.id} style={styles.similarProductItem} onPress={() => navigation.navigate('ProductDetail', { product: similarProduct })}>
                <Image source={{ uri: similarProductImages[index] }} style={styles.similarProductImage} />
                <Text style={styles.similarProductTitle}>{similarProduct.product_name}</Text>
                <Text style={styles.similarProductPrice}>{similarProduct.price} VND</Text>
              </TouchableOpacity>
            ))}
          </ScrollView>
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
