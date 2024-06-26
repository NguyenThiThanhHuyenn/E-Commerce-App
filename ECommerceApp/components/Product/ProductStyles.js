import { StyleSheet, Dimensions } from 'react-native';

const { width: viewportWidth } = Dimensions.get('window');

export default StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  carouselContainer: {
    height: 'auto',
    width: '100%',
    alignItems: 'center'


  },
  carousel: {},
  image: {
    ...StyleSheet.absoluteFillObject,
    width: '100%',
    height: '100%',
  },
  imageContainer: {
    width: '100%',
    height: 450,


  },
  infoContainer: {
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    padding: 20,

  },
  descriptionContainer: {
    marginTop: 10,
    borderWidth: 1,
    borderColor: '#cccccc',
    borderRadius: 5,
    padding: 10,
    height: 'auto'
  },
  priceContainer: {
    flexDirection: 'row',
    marginTop: 20,
    alignItems: 'center',
  },
  priceText: {
    fontSize: 24,
    color: '#000',
    fontWeight: 'bold',
  },
  buttonContainer: {
    marginTop: 30,
    flexDirection: 'row',
    justifyContent: 'center',
  },
  button: {
    backgroundColor: '#f0b11f',
    padding: 10,
    borderRadius: 5,
  },
  buttonText: {
    color: 'white',
    fontSize: 18,
    textAlign: 'center'
  },
  categoryBanner: {
    height: 200,
    width: '100%'
  },
  averageRating: {
    fontSize: 20,
    fontStyle: 'italic',
    color: 'gray',
  },
  storeName: {
    fontSize: 18,
    fontStyle: 'italic',
    color: 'gray',
    marginBottom: 20

  },
  inputContainer: {
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
  addButton: {
    backgroundColor: '#f0b11f',
    padding: 15,
    borderRadius: 5,
    marginTop: 20,
    width: '50%',
    alignSelf: 'center',
    marginVertical: '100%'
  },
  addButtonText: {
    color: 'white',
    fontSize: 18,
    textAlign: 'center',
  },
  buttonPicker: {
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
  quantityContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20
  },
  quantityText: {
    marginRight: 10,
    fontSize: 16,
    color: 'gray'
  },
  quantityInput: {
    width: 50,
    height: 30,
    borderWidth: 1,
    borderRadius: 5,
    borderColor: '#ccc',
    textAlign: 'center',
  },
  similarProductsContainer: {
    marginTop: 20,
    paddingHorizontal: 10,
  },
  similarProductsTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  similarProductItem: {
    marginRight: 10,
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 5,
    padding: 10,
    width: 150,
    backgroundColor: '#fff',
  },
  similarProductImage: {
    width: '100%',
    height: 100,
    resizeMode: 'cover',
    marginBottom: 10,
  },
  similarProductTitle: {
    fontSize: 14,
    fontWeight: 'bold',
  },
  similarProductPrice: {
    fontSize: 12,
    color: 'green',
  },
});


