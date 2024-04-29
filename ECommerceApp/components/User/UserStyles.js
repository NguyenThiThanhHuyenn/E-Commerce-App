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
  },
  registerFormContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
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
  avatarInput: {
    height: 40,
    width: 200,
    fontSize: 14,
    borderRadius: 5,
    borderWidth: 1,
    borderColor: "#eaeaea",
    backgroundColor: "#fafafa",
    paddingLeft: 10,
    flex: 1
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
  userTypeButton: {
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 5,
    backgroundColor: "#f0b11f",
    alignItems: "center",
    justifyContent: "center"
  },
  userTypeButtonText: {
    color: "#fff",
    fontSize: 16,
    fontWeight: "bold"
  }
});
export default styles;
