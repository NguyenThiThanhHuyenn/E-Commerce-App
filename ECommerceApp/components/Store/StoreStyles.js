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
    marginTop:20,
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
  containerCreateStore: {
    flex: 1,
    alignItems: 'center',
    paddingHorizontal: 20,
    backgroundColor: 'white'
  },
  input: {
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
    width: '100%',
  },
  pickImageButton: {
    backgroundColor: '#f0b11f',
    padding: 10,
    borderRadius: 5,
    width: '40%',
    alignItems: 'center',
    marginBottom: 10
  },
  pickImageButtonText: {
    color: 'white',
    fontWeight: 'bold'
  },
  createStoreButton: {
    backgroundColor: '#f0b11f',
    padding: 10,
    borderRadius: 5,
    width: '100%',
    alignItems: 'center'
  },
  createStoreButtonText: {
    color: 'white',
    fontWeight: 'bold'
  },
  headerProductList:{
    flexDirection:'row'
  },
  buttonAddProduct:{
    marginLeft: 20
  },
  storeInfo:{
    flexDirection: 'row'
  },
  buttonForSeller:{
    flexDirection: 'row'
  },
  buttonUpdate:{
    marginBottom: 20,
    marginRight: 20
  },
  containerUpdateStore:{
    flex: 1,
    alignItems: 'center',
    paddingHorizontal: 20,
    backgroundColor: 'white'
  },
  buttonSubmitUpdate:{
    backgroundColor: '#f0b11f',
    padding: 10,
    borderRadius: 5,
    width: '40%',
    alignItems: 'center',
    marginBottom: 10
  }
});
