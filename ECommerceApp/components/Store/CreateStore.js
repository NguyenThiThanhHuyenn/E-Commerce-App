import React, { useContext, useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Alert, Image } from 'react-native';
import MyContext from '../../configs/MyContext';
import API, { endpoints, HOST } from "../../configs/API";
import styles from './StoreStyles'; 
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useNavigation } from '@react-navigation/native';

export default CreateStoreScreen = () => {
  const [currentUser] = useContext(MyContext);
  const [storeName, setStoreName] = useState('');
  const [description, setDescription] = useState('');
  const navigation = useNavigation();
 

  const handleCreateStore = async () => {
    try {
      if (!currentUser) {
        throw new Error('User not found');
      }
  
      const userUrl = `${HOST}/user/${currentUser.id}/`;

      const formData = new FormData();
      formData.append('user', userUrl);
      formData.append('store_name', storeName);
      formData.append('description', description);
  
      const accessToken = await AsyncStorage.getItem('token_access'); 
  
      const response = await API.post(endpoints['create-store'], formData, {
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Content-Type': 'multipart/form-data'
        },
      });
      const newStoreId = response.data.id;
      Alert.alert('Success', 'Store created successfully');
      navigation.navigate('Store', { storeId: newStoreId });
    } catch (error) {
    //   console.error('Error creating store:', error);
      Alert.alert('Oops!', 'Failed to create store');
    //   console.error("Error response:", error.response); 
    //   console.error("Error details:", error.response?.status, error.response?.data);
      
     
      if (
        error.response?.status === 400 &&
        error.response?.data?.user &&
        error.response?.data?.user[0] === "store with this user already exists."
      ) {
        Alert.alert('Warning', 'You already manage a store. You cannot create another one.');
      }
    }
  };
  

  return (
    <View style={styles.containerCreateStore}>
      <TextInput
        placeholder="Store Name"
        value={storeName}
        onChangeText={text => setStoreName(text)}
        style={styles.input}
      />
      <TextInput
        placeholder="Description"
        value={description}
        onChangeText={text => setDescription(text)}
        multiline={true}
        numberOfLines={4}
        style={styles.input}
      />
      <TouchableOpacity
        onPress={handleCreateStore}
        style={styles.createStoreButton}
      >
        <Text style={styles.createStoreButtonText}>Create Store</Text>
      </TouchableOpacity>
    </View>
  );
};


