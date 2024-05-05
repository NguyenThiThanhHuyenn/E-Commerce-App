const React = require("react-native");

const { StyleSheet } = React;

const styles = StyleSheet.create({
  containerUserPage: {
    flex: 1,
    alignItems: "center",
    justifyContent: 'center',
    backgroundColor: 'white'
  },
  avatar: {
    width: 100,
    height: 100,
    borderRadius: 50,
    marginBottom: 20,
  },
  text: {
    marginBottom: 10,
  },
  containerView: {
    flex: 1,
    alignItems: "center",
    backgroundColor: 'white'
  },
  loginScreenContainer: {
    flex: 1,
  },
  logoText: {
    fontSize: 40,
    color: "#f0b11f",
    fontWeight: "800",
    marginTop: 150,
    marginBottom: 30,
    textAlign: "center",
  },
  loginFormView: {
    flex: 1,
  },
  loginFormTextInput: {
    height: 43,
    fontSize: 14,
    borderRadius: 5,
    borderWidth: 1,
    borderColor: "#eaeaea",
    backgroundColor: "#fafafa",
    paddingLeft: 10,
    marginTop: 5,
    marginBottom: 5,
  },
  loginButton: {
    backgroundColor: "#e8ab61",
    borderRadius: 50,
    height: 45,
    marginTop: 10,
    width: 350,
    alignItems: "center",
  },
  fbLoginButton: {
    height: 45,
    marginTop: 10,
    backgroundColor: 'transparent',
  },
  forgetPassword: {
    alignItems: "flex-end",
    color: "#594633",
    height: 45,
    marginTop: 10,
    backgroundColor: 'transparent',
  },
  text: {
    color: "#e3c888",
    fontSize: 18,
    height: 45,
    marginTop: 10,
    textAlign: "center"
  },
  registerFormContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: 'white'
  },
  registerFormTextInput: {
    height: 43,
    width: 300,
    fontSize: 14,
    borderRadius: 5,
    borderWidth: 1,
    borderColor: "#eaeaea",
    backgroundColor: "#fafafa",
    paddingLeft: 10,
    marginTop: 5,
    marginBottom: 10,
  },
  avatarInputContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 10
  },
  avatarInputLabel: {
    fontSize: 16,
    marginRight: 10
  },
  avatarInputButton: {
    backgroundColor: "#f0b11f",
    borderRadius: 5,
    paddingVertical: 10,
    paddingHorizontal: 15,
    alignItems: "center",
    justifyContent: "center",
    marginLeft: 10
  },
  avatarInputButtonText: {
    color: "#fff",
    fontSize: 14
  },
  selectedImage: {
    width: 100,
    height: 100,
    borderRadius: 50,
    marginTop: 10,
  },
  registerButton: {
    backgroundColor: "#e8ab61",
    borderRadius: 50,
    height: 45,
    width: 300,
    marginTop: 10,
    alignItems: "center",
    justifyContent: "center"
  },
  registerButtonText: {
    color: "#fff",
    fontSize: 16,
    fontWeight: "bold"
  },
  userTypeContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginTop: 10
  },
  userTypeLabel: {
    fontSize: 16,
    marginRight: 10
  },
  userTypePicker: {
    height: 50,
    width: 200,
    borderRadius: 5,
    borderWidth: 1,
    borderColor: "#eaeaea",
    backgroundColor: "#fafafa",
    marginTop: 5,
    marginBottom: 10,
    marginRight: 10,
  },
  createStoreButton: {
    flexDirection:'row',
    backgroundColor: "#f0b11f",
    borderRadius: 10,
    height: 40,
    width: 'auto',
    marginTop: 50,
    padding: 10,
    marginLeft: 250,
    justifyContent: "center"
  },
  createStoreButtonText: {
    color: "#fff",
    fontSize: 13,
    fontWeight: "bold",
    marginLeft:3
  },
  userFullName:{
    color: '#f0b11f',
    fontSize: 25,
    fontWeight: '500',
  },
  storeItem: {
    flexDirection:'row',
    marginBottom: 50,
    backgroundColor: '#fff',
    borderRadius: 8,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
    marginTop: 10,
    padding: 10,
  },
  storeName: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
    paddingTop: 15
  },
  miniStoreImage:{
    width: 50, 
    height: 50, 
    borderRadius: 10, 
    marginRight: 10,
  }

});
export default styles;
