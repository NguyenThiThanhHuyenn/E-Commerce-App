import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';

export default ProductVariants = ({ variants, onVariantSelect }) => {
  const [selectedVariants, setSelectedVariants] = useState([]);

  const handleVariantSelection = (variant) => {
    const index = selectedVariants.findIndex((v) => v.id === variant.id);
    if (index !== -1) {
      // Biến thể đã được chọn, hủy chọn
      const updatedVariants = [...selectedVariants];
      updatedVariants.splice(index, 1);
      setSelectedVariants(updatedVariants);
    } else {
      // Thêm biến thể mới được chọn
      setSelectedVariants([...selectedVariants, variant]);
    }

  };

  useEffect(() => {
    // Chuyển danh sách các biến thể đã chọn cho component cha
    onVariantSelect(selectedVariants);
  }, [selectedVariants]);

  const filteredVariants = variants.filter((variant) => variant !== null);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Options:</Text>
      <View style={styles.row}>
        {filteredVariants.map((variant) => variant.size && (
          <TouchableOpacity
            key={variant.id}
            onPress={() => handleVariantSelection(variant)}
            style={[
              styles.variantButton,
              {
                borderColor: selectedVariants.some((v) => v.id === variant.id) ? '#2196F3' : '#ddd',
                backgroundColor: selectedVariants.some((v) => v.id === variant.id) ? '#E3F2FD' : '#fff',
              },
            ]}
          >
            <Text style={styles.variantText}>{variant.size}</Text>
          </TouchableOpacity>
        ))}
      </View>
      <View style={styles.row}>
        {filteredVariants.map((variant) => variant.color && (
          <TouchableOpacity
            key={variant.id}
            onPress={() => handleVariantSelection(variant)}
            style={[
              styles.variantButton,
              {
                borderColor: selectedVariants.some((v) => v.id === variant.id) ? '#2196F3' : '#ddd',
                backgroundColor: selectedVariants.some((v) => v.id === variant.id) ? '#E3F2FD' : '#fff',
              },
            ]}
          >
            <Text style={styles.variantText}>{variant.color}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginVertical: 10,
  },
  title: {
    fontSize: 16,
    color: 'gray',
    marginBottom: 5,
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-start',
    flexWrap: 'wrap',
    marginBottom: 5,
  },
  variantButton: {
    padding: 10,
    borderWidth: 1,
    borderRadius: 5,
    marginRight: 5,
    marginBottom: 5,
  },
  variantText: {
    fontSize: 14,
    color: '#333',
    textAlign: 'center',
  },
});
