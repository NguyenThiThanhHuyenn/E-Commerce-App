import React, { useState } from "react";
import { View, TextInput, TouchableOpacity, Text, StyleSheet } from "react-native";

const ProductVariantInput = ({ variants, onAddVariant, onRemoveVariant }) => {
  const [size, setSize] = useState("");
  const [color, setColor] = useState("");
  const [selectedOption, setSelectedOption] = useState(null);
  const [showSizeInput, setShowSizeInput] = useState(false);
  const [showColorInput, setShowColorInput] = useState(false);

  const handleAddVariant = () => {
    if (selectedOption === "size" && size.trim() !== "") {
      onAddVariant({ size });
      setSize("");
    } else if (selectedOption === "color" && color.trim() !== "") {
      onAddVariant({ color });
      setColor("");
    }
  };

  return (
    <View style={styles.container}>
      <View style={styles.optionButtons}>
        <TouchableOpacity
          style={[styles.optionButton, selectedOption === "size" && styles.selectedOption]}
          onPress={() => {
            setSelectedOption("size");
            setShowSizeInput(true);
            setShowColorInput(false);
          }}
        >
          <Text style={styles.optionButtonText}>Add Size</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.optionButton, selectedOption === "color" && styles.selectedOption]}
          onPress={() => {
            setSelectedOption("color");
            setShowColorInput(true);
            setShowSizeInput(false);
          }}
        >
          <Text style={styles.optionButtonText}>Add Color</Text>
        </TouchableOpacity>
      </View>
      {showSizeInput && (
        <TextInput
          style={styles.input}
          placeholder="Size"
          value={size}
          onChangeText={(text) => setSize(text)}
        />
      )}
      {showColorInput && (
        <TextInput
          style={styles.input}
          placeholder="Color"
          value={color}
          onChangeText={(text) => setColor(text)}
        />
      )}
      <TouchableOpacity style={styles.addButton} onPress={handleAddVariant}>
        <Text style={styles.addButtonText}>Add</Text>
      </TouchableOpacity>

    </View>
  );
};


const styles = StyleSheet.create({
  container: {
    marginBottom: 20,
  },
  optionButtons: {
    flexDirection: "row",
    marginBottom: 10,
  },
  optionButton: {
    backgroundColor: "#f0b11f",
    borderRadius: 5,
    paddingVertical: 10,
    paddingHorizontal: 20,
    marginRight: 10,
  },
  selectedOption: {
    backgroundColor: "#4CAF50",
  },
  optionButtonText: {
    color: "white",
    fontWeight: "bold",
  },
  input: {
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
  addButton: {
    backgroundColor: '#f0b11f',
    borderRadius: 5,
    padding: 10,
    alignItems: 'center',
  },
  addButtonText: {
    color: 'white',
    fontWeight: 'bold',
  },
  variantList: {
    marginTop: 20,
  },
  variantItem: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 10,
    borderWidth: 1,
    borderColor: "gray",
    borderRadius: 5,
    padding: 10,
  },
});

export default ProductVariantInput;