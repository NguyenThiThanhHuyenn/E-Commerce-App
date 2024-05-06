import React, { useState, useEffect, useContext } from "react";

import styles from "./UserStyles";
import {
  Alert,
  Keyboard,
  KeyboardAvoidingView,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import { Button, SocialIcon } from "react-native-elements";
import * as Facebook from 'expo-facebook';
import { useNavigation } from '@react-navigation/native';
import { ActivityIndicator } from "react-native";
import API, {authApi, endpoints} from "../../configs/API";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";



const appId = "1047121222092614";


export default function LoginScreen() {

  const [username, setUsername] = useState();
  const [password, setPassword] = useState();
  const [loading, setLoading] = useState(false);
  const [user, dispatch] = useContext(MyContext);

  const navigation = useNavigation();

  const onLoginPress = async () => {
    setLoading(true);
    try {
      const loginForm = new FormData();
      loginForm.append("username", username)
      loginForm.append('password', password)
      loginForm.append('client_id',"byXcCLRfnSCPdiaBB7vp44fcVZPb5i74gUDghBiJ")
      loginForm.append('client_secret', "5T7JqcaoWv306D7QHbWz36XHqu8t0jvPS2cIQSGTMdt5590lwYkQhr89jusneGb4n2fnbSA9d5VNqIpDixGlO18Ya5rVK0Df9JSCvBnXdg9X1trY6iS7F1vCFVlQQQhw")
      loginForm.append('grant_type', "password")
      let res = await API.post(endpoints['login'], loginForm,
        {
          headers: {'Content-Type': 'multipart/form-data'}
        }
      );
      console.info(res.data)
      await AsyncStorage.setItem('token_access', res.data.access_token);
      let user = await authApi(res.data.access_token).get(endpoints['current-user']);
      dispatch({
        "type": "login",
        "payload": user.data
    });
    console.log("Current User Info:", user.data);
      navigation.navigate('HomeE');
    } catch (error) {
      Alert.alert("Oops!", error.response?.data?.detail ||"Please check your username and password. If you have a business account, please wait for confirmation from the system. Thank you.");
     
    }
    setLoading(false);
  };


  const onFbLoginPress = async () => {
    Alert.alert(
      `Please use our React Native Starer Kit instead. You can download it for free at https://instamobile.io`
    );
    // try {
    //   await Facebook.initializeAsync({
    //     appId,
    //   });
    //   const { type, token } = await Facebook.logInWithReadPermissionsAsync({
    //     permissions: ["public_profile", "email"],
    //   });
    //   if (type === "success") {
    //     const response = await fetch(
    //       `https://graph.facebook.com/me?access_token=${token}`
    //     );
    //     Alert.alert("Logged in!", `Hi ${(await response.json()).name}!`);
    //   }
    // } catch ({ message }) {
    //   Alert.alert(`Facebook Login Error: ${message}`);
    // }
  };

  const onForgetPasswordPress = () => {};

  return (
    <KeyboardAvoidingView style={styles.containerView} behavior="padding">
      <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
        <View style={styles.loginScreenContainer}>
          <View style={styles.loginFormView}>
            <Text style={styles.logoText}>ECOMMERCE</Text>
            <TextInput
              placeholder="Username"
              placeholderColor="#c4c3cb"
              style={styles.loginFormTextInput}
              onChangeText={text => setUsername(text)}
              value={username}
            />
            <TextInput
              placeholder="Password"
              placeholderColor="#c4c3cb"
              style={styles.loginFormTextInput}
              secureTextEntry={true}
              onChangeText={text => setPassword(text)}
              value={password}
            />
            <Button
              containerStyle={styles.forgetPassword}
              type="clear"
              onPress={() => onForgetPasswordPress()}
              title="Forget password?"
            />
            <Button
              buttonStyle={styles.loginButton}
              onPress={onLoginPress}
              title={loading ? "Logging in..." : "Login"}
              disabled={loading}
            />
            <Button
              containerStyle={styles.fbLoginButton}
              type="clear"
              onPress={() => onFbLoginPress()}
              title="Login With Facebook"
            />
            <Text style={styles.text}>OR</Text>
            <Button
              buttonStyle={styles.loginButton}
              onPress={() => navigation.navigate('Register')}
              title="Register"
            />
          </View>
        </View>
      </TouchableWithoutFeedback>
    </KeyboardAvoidingView>
  );
}
