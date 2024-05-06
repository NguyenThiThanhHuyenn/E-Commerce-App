import React, { useContext, useEffect, useState } from 'react';
import { View, Text, Image, ScrollView, TouchableOpacity } from 'react-native';
import styles from "./UserStyles"; 
import MyContext from '../../configs/MyContext';
import { Icon } from 'react-native-elements';
import { useNavigation } from '@react-navigation/native';
import API, { endpoints } from "../../configs/API";

export default UserPage = () => {
  const [currentUser] = useContext(MyContext);
  const [store, setStore] = useState(null); 
  const navigation = useNavigation();

  useEffect(() => {
    if (currentUser) {
      const fetchStore = async () => {
        try {
          const response = await API.get(endpoints['store-by-user'].replace('{user_id}', currentUser.id));
          setStore(response.data.results[0]);
          console.log("Response data:", response.data.results);
        } catch (error) {
          console.error('Error fetching store:', error);
          console.error('Error response:', error.response); 
          console.error('Error details:', error.response?.status, error.response?.data);
        }
      };
      fetchStore();
    }
  }, [currentUser]);

  if (!currentUser) {
    return null;
  }

  const handleNavigateToStore = () => {
    navigation.navigate('Store', { storeId: store.id });
  };

  const renderCreateStoreButton = () => {
    if (currentUser.role === 'seller') {
      return (
        <TouchableOpacity style={styles.createStoreButton} onPress={handleCreateStore}>
          <Icon name='add-circle-outline' type='ionicon' color={'white'} size={15}/>
          <Text style={styles.createStoreButtonText}>Create Store</Text>
        </TouchableOpacity>
      );
    } else {  
      return null;
    }
  };

  const handleCreateStore = () => {
    navigation.navigate('CreateStore');
  };

  return (
    <ScrollView>
      <View style={styles.containerUserPage}>
        <Image source={{ uri: currentUser.avatar_url }} style={styles.avatar} />
        <Text style={styles.userFullName}>{currentUser.first_name} {currentUser.last_name}</Text>
        {renderCreateStoreButton()}

        {store && (
          <TouchableOpacity style={styles.storeItem} onPress={handleNavigateToStore}>
            <Image source={{uri: store.wallpaper_url}} style={styles.miniStoreImage}/>
            <Text style={styles.storeName}>{store.store_name}</Text>
          </TouchableOpacity>
        )}

        {/* <Text style={styles.userInfo}>Username: {currentUser.username}</Text>
        <Text style={styles.userInfo}>Email: {currentUser.email}</Text>
        <Text style={styles.userInfo}>Address: {currentUser.address}</Text>
        <Text style={styles.userInfo}>Phone: {currentUser.phone_number}</Text> */}
        
      </View>
    </ScrollView>
  );
};
