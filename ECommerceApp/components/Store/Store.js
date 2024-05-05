import React, { useState, useEffect, useContext } from "react";
import { View, Text, Image, ScrollView, TouchableOpacity } from "react-native";
import PropTypes from 'prop-types';
import API, { endpoints } from "../../configs/API";
import styles from './StoreStyles';
import { Icon } from "react-native-elements";
import ReviewComponent from "../Review/ReviewComponent"; // Import ReviewComponent
import MyContext from "../../configs/MyContext";


const Store = ({ route }) => {
  const [currentUser] = useContext(MyContext);
  const { storeId } = route.params;
  const [store, setStore] = useState(null);
  const [products, setProducts] = useState([]);
  const [storeReviews, setStoreReviews] = useState([]);
  const [storeAverageRating, setStoreAverageRating] = useState(0);

  // Tính toán average rating của cửa hàng hoặc sản phẩm
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
    
        // Lấy danh sách đánh giá của cửa hàng cụ thể
        const storeReviewsResponse = await API.get(endpoints['reviews-by-store'].replace('{store_id}', storeId));
        const storeReviews = storeReviewsResponse.data;
    
        // Tính toán trung bình đánh giá của cửa hàng từ danh sách đánh giá
        const storeAverageRating = calculateAverageRating(storeReviews);
    
        setStore(prevStore => ({ ...prevStore, reviews: storeReviews, averageRating: storeAverageRating }));
  
        // Lấy thông tin người dùng cho từng đánh giá
        const reviewsWithUserDetails = await Promise.all(storeReviews.map(async review => {
          const userResponse = await API.get(`/user/${review.user}/`);
          const userDetails = userResponse.data;
          return { ...review, username: userDetails.username};
        }));
        
        setStoreReviews(reviewsWithUserDetails);
    
        const productsResponse = await API.get(endpoints['products-by-store'].replace('{store_id}', storeId));
        const productsData = productsResponse.data.results;
    
        // Duyệt qua danh sách sản phẩm và gọi API để lấy ảnh đầu tiên của mỗi sản phẩm
        const productsWithImages = await Promise.all(productsData.map(async (product) => {
          try {
            const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', product.id));
            const productImages = productImageResponse.data.results;
            // Lấy ảnh đầu tiên từ danh sách ảnh và gán vào product
            if (productImages.length > 0) {
              product.image_url = productImages[0].image_url;
            }
            const reviewsResponse = await API.get(endpoints['reviews-by-product'].replace('{product_id}', product.id));
            product.reviews = reviewsResponse.data;
          } catch (error) {
            console.error("Error fetching product data:", error);
          }
          return product;
        }));
    
        setProducts(productsWithImages);
        setStoreAverageRating(storeAverageRating);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };
    
    fetchData();
  }, [storeId]);

  const isStoreOwner = store && store.user.includes(`/user/${currentUser.id}/`);


  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {store && (
        <View style={styles.storeInfoContainer}>
          <Image source={{ uri: store.wallpaper_url }} style={styles.storeWallpaper} />
          <View style={styles.storeHeader}>
            <Text style={styles.storeName}>{store.store_name}</Text>
          </View>
          <View style={styles.storeInfo} >
          <View>
          <Text style={styles.storeAverageRating}>
              Rating: {storeAverageRating.toFixed(1)}/5.0
            </Text>
          <Text style={styles.storeDescription}>{store.description}</Text>
          </View>
          {isStoreOwner && (
              <View style={styles.buttonForSeller}>
                <TouchableOpacity style={styles.buttonUpdate}>
                  <Icon name="pencil-outline" type="ionicon"/>
                </TouchableOpacity>
                <TouchableOpacity style={styles.button}>
                <Icon name="stats-chart-outline" type="ionicon"/> 
                </TouchableOpacity>
              </View>
            )}
          </View>
        </View>
      )}

      <View style={styles.productsContainer}>
        <View style={styles.headerProductList}>
          <Text style={styles.productsTitle}>Products</Text>
            {isStoreOwner && (
              <View style={styles.buttonAddProduct}>
                <TouchableOpacity style={styles.button}>
                <Icon name="add-outline" type="ionicon" size={25}/>
                </TouchableOpacity>
              </View>
            )}
        </View>
        {products.map((product) => (
          <View key={product.id} >
            <TouchableOpacity><View style={styles.productItem}>
              <Image source={{ uri: product.image_url }} style={styles.productImage} />
              <View style={styles.productInfo}>
                <Text style={styles.productName}>{product.product_name}</Text>
                <Text style={styles.productPrice}>{product.price} VND</Text>
                <Text style={styles.productAverageRating}>
                  {calculateAverageRating(product.reviews).toFixed(1)}/5.0<Icon  name='star' size={20} type='ionicon' color={'#b89d3b'}/>
                </Text>
              </View>
            </View></TouchableOpacity>
          </View>
        ))}
      </View>

      <View>
      <Text style={styles.title }>Reviews</Text>
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
