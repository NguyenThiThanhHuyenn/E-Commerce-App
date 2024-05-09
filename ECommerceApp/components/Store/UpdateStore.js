import React, { useState, useEffect } from "react";
import { View, Text, TextInput, TouchableOpacity, Alert, Image } from "react-native";
import * as ImagePicker from 'expo-image-picker';
import API, { endpoints } from "../../configs/API";
import styles from './StoreStyles';
import AsyncStorage from "@react-native-async-storage/async-storage";
import { useNavigation } from "@react-navigation/native";

export default UpdateStoreScreen = ({ route }) => {
    const { storeId } = route.params;
    const [store, setStore] = useState(null);
    const [wallpaper, setWallpaper] = useState("");
    const [description, setDescription] = useState("");
    const [loading, setLoading] = useState(false);
    const navigation = useNavigation();

    useEffect(() => {
        const fetchStore = async () => {
            try {
                const response = await API.get(endpoints.store.replace('{store_id}', storeId));
                setStore(response.data);
                setWallpaper(response.data.wallpaper_url || "");
                setDescription(response.data.description || "");
            } catch (error) {
                console.error("Error fetching store:", error);
                Alert.alert("Error", "Failed to fetch store data. Please try again later.");
                console.error("Error details:", error.response?.status, error.response?.data); 
            }
        };

        fetchStore();
    }, []);

    const handleUpdateStore = async () => {
        try {
            setLoading(true);
            
            const formData = new FormData();
            formData.append('description', description.trim()); 
            if (wallpaper) {
                const filename = wallpaper.split('/').pop();
                const match = /\.(\w+)$/.exec(filename);
                const type = match ? `image/${match[1]}` : 'image';
            
                formData.append('wallpaper', { uri: wallpaper, name: filename, type });
            } else {
                formData.append('wallpaper', wallpaper);
            }
            
            const accessToken = await AsyncStorage.getItem('token_access'); 

            const response = await API.patch(endpoints['store'].replace('{store_id}', storeId), formData, { 
              headers: {
                'Authorization': `Bearer ${accessToken}`,
                'Content-Type': 'multipart/form-data'
              }
            });
            Alert.alert("Success", "Store updated successfully");
            navigation.navigate('Store', { storeId: storeId });
        } catch (error) {
            console.error("Error updating store:", error);
            Alert.alert("Error", "Failed to update store. Please try again later.");
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
      aspect: [4, 3],
      quality: 1,
    });

    if (!result.canceled) {
      console.log("Result: ", result);
      console.info("Wallpaper: ", result.assets[0].uri);
      setWallpaper(result.assets[0].uri);
    }
    };

    function ImageViewer({ wallpaper }) {
        const imageSource = wallpaper ? { uri: wallpaper } : require('../../assets/default-wall.png');
        return <Image source={imageSource} style={{ width: '100%', height: 200, marginBottom: 20}} />;
    }
    

    return (
        <View style={styles.containerUpdateStore}>
            <TextInput
                style={styles.input}
                placeholder="New Description"
                value={description}
                multiline={true}
                numberOfLines={4}
                onChangeText={(text) => setDescription(text)}
            />
            <ImageViewer wallpaper={wallpaper}/>
            <TouchableOpacity style={styles.pickImageButton} onPress={pickImage}>
                <Text style={styles.pickImageButtonText}>Pick Image</Text>
            </TouchableOpacity>
            
            <TouchableOpacity 
                style={styles.buttonSubmitUpdate} 
                onPress={handleUpdateStore} 
                disabled={loading} 
            >
                <Text style={styles.createStoreButtonText}>{loading ? "Updating..." : "Update"}</Text>
            </TouchableOpacity>
        </View>
    );
};
