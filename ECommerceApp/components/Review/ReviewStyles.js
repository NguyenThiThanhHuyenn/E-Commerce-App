import { StyleSheet } from "react-native";

export default StyleSheet.create({
    container: {
        backgroundColor: '#ffffff',
        borderRadius: 8,
        padding: 16,
        marginBottom: 16,
        borderWidth: 2,
        borderColor: '#e0e0e0',
     
    },
    header: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginBottom: 8,
    },
    userName: {
        fontWeight: 'bold',
        fontSize: 16,
    },
    date: {
        color: '#666666',
    },
    rating: {
        fontWeight: 'bold',
        marginBottom: 8,
    },
    icon: {
        alignItems:'baseline'
    },
    comment: {
        color: '#333333',
        marginBottom: 5
    },
});