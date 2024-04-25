const React = require("react-native");

const { StyleSheet } = React;

const styles = StyleSheet.create({
  containerView: {
    flex: 1,
    alignItems: "center"
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
  }
});
export default styles;
