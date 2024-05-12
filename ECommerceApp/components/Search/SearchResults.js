import React from 'react';
import { View, Text, TouchableOpacity, FlatList, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import AppStyles from '../../styles/AppStyles';
import DropdownPicker from 'react-native-dropdown-picker';

const SearchResultScreen = ({ route }) => {
  const { products, productImages } = route.params;
  const navigation = useNavigation();

  const renderProductItem = ({ item }) => {
    const productImage = productImages[item.id];

    if (!productImage) {
      return null;
    }

    const imageUrl = productImage.image_url;

    return (
      <TouchableOpacity
        style={AppStyles.container}
        onPress={() => navigation.navigate('ProductDetail', { product: item })}
      >
        <Image source={{ uri: imageUrl }} style={AppStyles.images} />
        <Text style={AppStyles.productName}>{item.product_name}</Text>
        <Text style={AppStyles.price}>{item.price}</Text>
      </TouchableOpacity>
    );
  };

  return (
    <View style={{ flex: 1 }}>
      <FlatList
        key="productsFlatList"
        showsVerticalScrollIndicator={false}
        data={products}
        renderItem={renderProductItem}
        keyExtractor={(item) => item.id.toString()}
        numColumns={2}
        style={{ backgroundColor: 'white' }}
      />
    </View>
  );
};

export default SearchResultScreen;
