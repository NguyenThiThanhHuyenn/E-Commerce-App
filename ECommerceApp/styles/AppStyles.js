// import { StyleSheet } from "react-native";

// export default StyleSheet.create({
//     container: {
//         flex: 1,
//         backgroundColor: '#fff', // Thay đổi màu nền thành màu trắng
//         paddingHorizontal: 20, // Thêm padding ngang
//         paddingTop: 20, // Thêm padding đỉnh
//         alignItems: "center",
//     },
// });
// Styles.js

import { StyleSheet, Dimensions } from 'react-native';

// screen sizing
const { width, height } = Dimensions.get('window');
// orientation must fixed
const SCREEN_WIDTH = width < height ? width : height;

const productNumColumns = 2;
// item size
const PRODUCT_ITEM_HEIGHT = 150;
const PRODUCT_ITEM_MARGIN = 20;

// 2 photos per width
const ProductCard = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginLeft: PRODUCT_ITEM_MARGIN,
    marginTop: 20,
    width: (SCREEN_WIDTH - (productNumColumns + 1) * PRODUCT_ITEM_MARGIN) / productNumColumns,
    height: PRODUCT_ITEM_HEIGHT + 75,
    borderColor: '#cccccc',
    borderWidth: 0.5,
    borderRadius: 15
  },
  images: {
    width: (SCREEN_WIDTH - (productNumColumns + 1) * PRODUCT_ITEM_MARGIN) / productNumColumns,
    height: PRODUCT_ITEM_HEIGHT,
    borderRadius: 15,
    borderBottomLeftRadius: 0,
    borderBottomRightRadius: 0
  },
  productName: {
    flex: 1,
    fontSize: 17,
    fontWeight: 'bold',
    textAlign: 'center',
    color: '#444444',
    marginTop: 3,
    marginRight: 5,
    marginLeft: 5,
  },
  price: {
    marginTop: 5,
    marginBottom: 5
  }
});

export default ProductCard;