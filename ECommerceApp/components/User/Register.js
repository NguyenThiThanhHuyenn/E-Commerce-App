import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Alert, Image, ActivityIndicator, ScrollView } from 'react-native';
import { Picker } from '@react-native-picker/picker';
import * as ImagePicker from 'expo-image-picker';
import styles from './UserStyles';
import API, { endpoints } from "../../configs/API";
import { useNavigation } from '@react-navigation/native';


const Register = () => {
  const navigation = useNavigation();
  const [formData, setFormData] = useState({
    first_name: '',
    last_name: '',
    email: '',
    username: '',
    password: '',
    confirmPassword: '',
    address: '',
    phone_number: '', 
    role: 'customer', 
    avatar_url: null
  });
  const [loading, setLoading] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);

  const handleInputChange = (key, value) => {
    setFormData({ ...formData, [key]: value });
  };

  const handleRegister = async () => {
    if (!formData.avatar_url) {
      Alert.alert("Avatar is required");
      return;
    }

    if (formData.password !== formData.confirmPassword) {
      Alert.alert("Passwords do not match");
      return;
    }

    const form = new FormData();
    Object.keys(formData).forEach(key => {
      if (key === 'avatar_url') {
        let filename = formData.avatar.split('/').pop();
        let match = /\.(\w+)$/.exec(filename);
        let type = match ? `image/${match[1]}` : `image`;
        form.append('avatar_url', { uri: formData.avatar_url, name: filename, type });
      } else if (key !== 'confirmPassword') {
        form.append(key, formData[key]);
      }
    });

    try {
      setLoading(true);
      const response = await API.post(endpoints['register'], form, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      console.log("Data sent:", formData);
      console.log(response.data);
      Alert.alert("Registration Successful");
      navigation.navigate('Login');
    } catch (error) {
      console.error(error);
      Alert.alert("Registration Failed", error.message);
      console.error("Error details:", error.response?.status, error.response?.data); 
    } finally {
      setLoading(false);
    }
  };

  const pickImage = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== 'granted') {
      Alert.alert("Permission to access gallery was denied");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 1,
    });

    if (!result.canceled) {
      setSelectedImage(result.assets[0].uri);
      setFormData({ ...formData, avatar_url: result.assets[0].uri });
      console.log("Result: ", result);
      console.info("SelectedImage: ", result.assets[0].uri);
    }
  };

  function ImageViewer({ selectedImage }) {
    const imageSource = selectedImage  ? { uri: selectedImage } : require('../../assets/default.png');
  
    return <Image source={imageSource} style={styles.avatar} />;
  }

  return (
    <ScrollView>
      <View style={styles.registerFormContainer}>
        <Text style={styles.logoText}>Register</Text>
        <ImageViewer
          selectedImage={selectedImage}
        />
        <View style={styles.avatarInputContainer}>
          <Text style={styles.avatarInputLabel}>Avatar:</Text>
          <TouchableOpacity style={styles.avatarInputButton} onPress={pickImage}>
            <Text style={styles.avatarInputButtonText}>Choose Image</Text>
          </TouchableOpacity>
        </View>

        <TextInput
          style={styles.registerFormTextInput}
          placeholder="First Name"
          onChangeText={text => handleInputChange('first_name', text)}
          value={formData.first_name}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Last Name"
          onChangeText={text => handleInputChange('last_name', text)}
          value={formData.last_name}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Email"
          onChangeText={text => handleInputChange('email', text)}
          value={formData.email}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Address"
          onChangeText={text => handleInputChange('address', text)}
          value={formData.address}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Phone Number"
          onChangeText={text => handleInputChange('phone_number', text)}
          value={formData.phone_number}
        />

        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Username"
          onChangeText={text => handleInputChange('username', text)}
          value={formData.username}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Password"
          secureTextEntry
          onChangeText={text => handleInputChange('password', text)}
          value={formData.password}
        />
        <TextInput
          style={styles.registerFormTextInput}
          placeholder="Confirm Password"
          secureTextEntry
          onChangeText={text => handleInputChange('confirmPassword', text)}
          value={formData.confirmPassword}
        />

        <View style={styles.userTypeContainer}>
          <Text style={styles.userTypeLabel}>User Type:</Text>
          <Picker
            style={styles.userTypePicker}
            selectedValue={formData.role}
            onValueChange={itemValue => handleInputChange('role', itemValue)}
          >
            <Picker.Item label="Customer" value="customer" />
            <Picker.Item label="Seller" value="seller" />
          </Picker>
        </View>

        {loading ? <ActivityIndicator /> : (
          <TouchableOpacity style={styles.registerButton} onPress={handleRegister}>
            <Text style={styles.registerButtonText}>Register</Text>
          </TouchableOpacity>
        )}
      </View>
    </ScrollView>
  );
};

export default Register;
