import React, { useState, useEffect } from "react";
import { TouchableOpacity, View, Text, Image, ScrollView, useWindowDimensions } from "react-native";
import PropTypes from 'prop-types';
import Carousel from 'react-native-snap-carousel';
import API, { endpoints } from "../../configs/API";
import styles from './ProductStyles';
import HTML from 'react-native-render-html';

const ProductDetail = ({ route }) => {
  const { product } = route.params;
  const windowWidth = useWindowDimensions().width;
  const [productImages, setProductImages] = useState([]);

  useEffect(() => {
    const fetchProductImages = async () => {
      try {
        const productImageResponse = await API.get(endpoints['product-images'].replace('{product_id}', product.id));
        setProductImages(productImageResponse.data.results);
      } catch (error) {
        console.error(error);
      }
    };

    fetchProductImages();
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
        <ScrollView style={styles.descriptionContainer} showsHorizontalScrollIndicator={true}>
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
    </ScrollView>
  );
};

ProductDetail.propTypes = {
  route: PropTypes.object.isRequired,
};

export default ProductDetail;
