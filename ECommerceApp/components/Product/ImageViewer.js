import React from 'react';
import { View, Image, StyleSheet, TouchableOpacity } from 'react-native';

const ImageViewer = ({ images, onDeleteImage }) => {
  const handleDeleteImage = (index) => {
    onDeleteImage(index);
  };

  return (
    <View style={styles.imageContainer}>
      {images.map((image, index) => (
        <TouchableOpacity key={index} onLongPress={() => handleDeleteImage(index)}>
          <Image source={{ uri: image }} style={styles.image} />
        </TouchableOpacity>
      ))}
    </View>
  );
};

const styles = StyleSheet.create({
  imageContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'center', 
  },
  image: {
    width: 100,
    height: 100,
    margin: 5,
    alignItems:'center'
  },
});

export default ImageViewer;
