import React from "react";

import styles from "./User";
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


export default function RegisterScreen() {

    const navigation = useNavigation()
  const onBackToLoginPress = () => {
    navigation.goBack();
  };

  return (
    <View>
      {/* Các thành phần khác của trang đăng ký */}
      <Button title="Back to Login" onPress={onBackToLoginPress} />
    </View>
  );
}
