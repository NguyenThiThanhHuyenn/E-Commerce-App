import { StyleSheet } from "react-native";

export default StyleSheet.create({
    categoryItem: {
        flexDirection: 'column', 
        alignItems: 'center',
        paddingHorizontal: 20,
        paddingVertical: 10,
        marginBottom: 10,
        borderRadius: 10,
        backgroundColor: 'red'
    },
    categoryImage: {
        width: 100, 
        height: 100, 
        borderRadius: 100, 
    },
    categoryText: {
        fontSize: 16,
        fontWeight: 'bold' 
    }
});
