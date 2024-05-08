import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#f0b11f'
  },
  listItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 10,
  },
  quantityInput: {
    borderWidth: 1,
    padding: 5,
    marginRight: 10,
  },
  totalText: {
    fontSize: 18,
    fontWeight: 'bold',
    marginTop: 20,
    color:'gray'
  },
  placeOrderButton: {
    backgroundColor: '#f0b11f',
    padding: 10,
    borderRadius: 5,
    marginTop: 20,
  },
  placeOrderButtonText: {
    color: 'white',
    textAlign: 'center',
  },
  productContainer: {
    padding: 10,
    marginBottom: 10,
    backgroundColor: 'white',
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#ccc',
    width:"100%"
},
productName: {
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 5,
},
quantity: {
    fontSize: 14,
    marginBottom: 5,
},
price: {
    fontSize: 14,
    marginBottom: 5,
},
note: {
    fontSize: 14,
},
userInfoContainer: {
  marginBottom: 30,
  padding: 10,
  backgroundColor: '#f0f0f0',
  borderRadius: 8,
  borderWidth: 1
},
userInfoName: {
  fontSize: 18,
  fontWeight: 'bold',
  marginBottom: 5,
},
userInfo: {
  fontSize: 16,
  marginBottom: 3,
},
paymentContainer: {
  flexDirection: 'row',
  alignItems: 'center',
  marginBottom: 10,
},
paymentLabel: {
  fontSize: 16,
  fontWeight: 'bold',
  marginRight: 10,
},
paymentPicker: {
  flex: 1,
  height: 50,
  borderWidth: 1,
  borderColor: '#ccc',
  borderRadius: 8,
  paddingLeft: 10,
},
});

export default styles;
