import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, Image, TextInput, Alert, ScrollView } from 'react-native';
import { Picker } from '@react-native-picker/picker';
import * as ImagePicker from 'expo-image-picker';
import API, { HOST, endpoints } from '../../configs/API';
import styles from './ProductStyles';
import AsyncStorage from "@react-native-async-storage/async-storage";
import ImageViewer from './ImageViewer';
import ProductVariantInput from './ProductVariantInput';

const AddProduct = ({ route }) => {
  const { storeId } = route.params;
  const [images, setImages] = useState([]);
  const [loading, setLoading] = useState(false);
  const [tempImages, setTempImages] = useState([]);
  const [productVariants, setProductVariants] = useState([]);
  const [productData, setProductData] = useState({
    store: null,
    category: null,
    product_name: '',
    price: '',
    description: '',
    stock: 0,
  });
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await API.get(endpoints['categories']);
        if (response.status === 200) {
          setCategories(response.data.results);
        } else {
          console.error('Failed to fetch categories:', response.statusText);
        }
      } catch (error) {
        console.error('Error fetching categories:', error.message);
      }
    };

    fetchCategories();
  }, []);

  const handleDeleteImage = (index) => {
    const updatedImages = [...images];
    updatedImages.splice(index, 1);
    setImages(updatedImages);
  };


  const pickImage = async () => {
    if (images.length + tempImages.length >= 10) {
      Alert.alert('Warning', 'You can only upload up to 10 images for each product.');
      return;
    }

    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 1,
    });

    if (!result.canceled) {
      setTempImages([...tempImages, result.assets[0].uri]);
    }
  };

  const handleSaveImages = () => {
    setImages([...images, ...tempImages]);
    setTempImages([]);
  };




  const handleInputChange = (key, value) => {
    setProductData({
      ...productData,
      [key]: value,
    });
  };

  const handleAddProduct = async () => {
    try {
      setLoading(true);

      const accessToken = await AsyncStorage.getItem('token_access');

      const productFormData = new FormData();
      productFormData.append('store', storeId);
      productFormData.append('category', productData.category);
      productFormData.append('product_name', productData.product_name);
      productFormData.append('price', productData.price);
      productFormData.append('description', productData.description);
      productFormData.append('stock', productData.stock);

      console.log(productFormData);

      const productResponse = await API.post(endpoints.products, productFormData, {
        headers: {
          Authorization: `Bearer ${accessToken}`,
          'Content-Type': 'multipart/form-data'
        },
      });

      if (productResponse.status === 201) {
        const productId = productResponse.data.id;
        const productUrl = `${HOST}/products/${productId}/`;

        for (const image of images) {
          const imageFormData = new FormData();
          imageFormData.append('product', productUrl);
          imageFormData.append('image', {
            uri: image,
            type: 'image/jpeg',
            name: `image_${Date.now()}.jpg`,
          });

          await API.post(endpoints['add-product-images'], imageFormData, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
              'Content-Type': 'multipart/form-data',
            },
          });
        }

        // Loop through productVariants to add each variant
        const colorVariants = productVariants.filter(variant => variant.color);
        const sizeVariants = productVariants.filter(variant => variant.size);

        // Lưu biến thể color
        for (const colorVariant of colorVariants) {
          const colorVariantFormData = new FormData();
          colorVariantFormData.append('product_id', productId);
          colorVariantFormData.append('color', colorVariant.color);

          const colorVariantResponse = await API.post(endpoints['productvariants'], colorVariantFormData, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
              'Content-Type': 'multipart/form-data',
            },
          });

          if (colorVariantResponse.status !== 201) {
            throw new Error('Failed to add product variant');
          }
        }

        // Lưu biến thể size
        for (const sizeVariant of sizeVariants) {
          const sizeVariantFormData = new FormData();
          sizeVariantFormData.append('product_id', productId);
          sizeVariantFormData.append('size', sizeVariant.size);

          const sizeVariantResponse = await API.post(endpoints['productvariants'], sizeVariantFormData, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
              'Content-Type': 'multipart/form-data',
            },
          });

          if (sizeVariantResponse.status !== 201) {
            throw new Error('Failed to add product variant');
          }
        }

        Alert.alert('Success', 'Product added successfully');
        setProductData({
          store: storeId,
          category: null,
          product_name: '',
          price: '',
          description: '',
          stock: 0,
        });
        setImages([]);
        setProductVariants([]);
      }
    } catch (error) {
      console.error('Error adding product:', error);
      Alert.alert('Error', 'Failed to add product. Please try again later.');
      console.error('Error:', error);
      console.error('Error response:', error.response);
      console.error('Error details:', error.response?.status, error.response?.data);
    } finally {
      setLoading(false);
    }
  };

  const handleAddVariant = (variant) => {
    setProductVariants([...productVariants, variant]);
  };

  const handleRemoveVariant = (variantToRemove) => {
    const updatedVariants = productVariants.filter(variant => variant !== variantToRemove);
    setProductVariants(updatedVariants);
  };



  return (
    <ScrollView showsVerticalScrollIndicator={false}>
      <View style={styles.inputContainer}>
        <TextInput
          placeholder="Product Name"
          value={productData.product_name}
          onChangeText={(text) => handleInputChange('product_name', text)}
          style={styles.input}
        />
        <Picker
          selectedValue={productData.category}
          onValueChange={(itemValue, itemIndex) => setProductData(prevData => ({
            ...prevData,
            category: itemValue
          }))}
          style={styles.input}
        >
          <Picker.Item label="Select Category" value={null} />
          {categories.length > 0 && categories.map((category) => (
            <Picker.Item key={category.id} label={category.name} value={category.id} />
          ))}
        </Picker>
        <TextInput
          placeholder="Price"
          value={productData.price}
          onChangeText={(text) => handleInputChange('price', text)}
          style={styles.input}
          keyboardType="numeric"
        />
        <TextInput
          placeholder="Description"
          value={productData.description}
          multiline={true}
          numberOfLines={4}
          onChangeText={(text) => handleInputChange('description', text)}
          style={[styles.input, { height: 100 }]}
        />
        <TextInput
          placeholder="Stock"
          value={productData.stock.toString()}
          onChangeText={(text) => handleInputChange('stock', text !== '' ? parseInt(text) : 0)}
          style={styles.input}
          keyboardType="numeric"
        />
        <TouchableOpacity style={styles.buttonPicker} onPress={pickImage}>
          <Text style={styles.pickImageButtonText}>Add Image</Text>
        </TouchableOpacity>

        <ImageViewer images={images} onDeleteImage={handleDeleteImage} />

        <TouchableOpacity style={[styles.buttonPicker, { display: tempImages.length === 0 ? 'none' : 'flex' }]} onPress={handleSaveImages}>
          <Text style={styles.pickImageButtonText}>Save Images</Text>
        </TouchableOpacity>

        <View>
          <ProductVariantInput
            variants={productVariants}
            onAddVariant={handleAddVariant}

          />
        </View>
        <View>
          {productVariants.map((variant, index) => (
            <TouchableOpacity
              key={index}
              style={styles.variantItem}
              onLongPress={() => handleRemoveVariant(variant)}>
              <Text>{variant.size || variant.color}</Text>
            </TouchableOpacity>
          ))}
        </View>


        <TouchableOpacity onPress={handleAddProduct} style={styles.addButton} disabled={loading}>
          <Text style={styles.addButtonText}>{loading ? 'Adding...' : 'Add Product'}</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

export default AddProduct;
