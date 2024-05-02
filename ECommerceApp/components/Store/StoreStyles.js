import { StyleSheet } from "react-native";

export default StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  storeInfoContainer: {
    padding: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
  },
  storeWallpaper: {
    width: '100%',
    height: 200,
    resizeMode: 'cover',
    marginBottom: 10,
  },
  storeName: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  storeDescription: {
    fontSize: 16,
    color: '#666',
  },
  productsContainer: {
    padding: 20,
  },
  productsTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  productItem: {
    flexDirection: 'row', 
    alignItems: 'center',
    marginBottom: 15,
    borderWidth: 2,
    borderColor: '#e0e0e0',
    borderRadius: 5
  },
  productImage: {
    width: 100,
    height: 100,
    marginRight: 10,
    resizeMode: 'cover',
  },
  productInfo: {
    flex: 1,
    flexDirection: 'column',
    padding: 'auto'
  },
  productName: {
    fontSize: 15,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  productPrice: {
    fontSize: 16,
    color: '#666',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    padding: 20,

  },
});
