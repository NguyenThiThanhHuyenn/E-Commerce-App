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
    comment: {
        color: '#333333',
        marginBottom: 5
    },
    containerCreateReview: {
        padding: 20,
        backgroundColor: '#fff',
        borderRadius: 10,
        marginBottom: 20,
        elevation: 2,
      },
      ratingContainer: {
        flexDirection: 'row',
        justifyContent: 'center',
        marginBottom: 20,
      },
      commentInput: {
        borderWidth: 1,
        borderColor: '#ccc',
        borderRadius: 5,
        padding: 10,
        marginBottom: 20,
        minHeight: 100,
      },
      submitButton: {
        backgroundColor: '#007bff',
        padding: 15,
        borderRadius: 5,
        alignItems: 'center',
      },
      submitButtonText: {
        color: '#fff',
        fontSize: 16,
        fontWeight: 'bold',
      },
});