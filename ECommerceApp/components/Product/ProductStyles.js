import { StyleSheet, Dimensions } from 'react-native';

const { width: viewportWidth } = Dimensions.get('window');

export default StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  carouselContainer: {
    height: 'auto',
    marginHorizontal: 45,

    
  },
  carousel: {},
  image: {
    ...StyleSheet.absoluteFillObject,
    width: '100%',
    height: '100%',
  },
  imageContainer: {
    width: viewportWidth,
    height: 250,
    
  
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
    backgroundColor: '#2cd18a',
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
  
  }
});


