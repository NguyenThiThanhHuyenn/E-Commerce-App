import { StyleSheet } from "react-native";

export default StyleSheet.create({
    categoryItem: {
        flexDirection: 'column', 
        alignItems: 'center',
        paddingHorizontal: 20,
        paddingVertical: 20,
        marginBottom: 30,
        backgroundColor: 'white'
    },
    categoryImage: {
        width: 80, 
        height: 80, 
        borderRadius: 80,
        backgroundColor: 'white'
    },
    categoryText: {
        fontSize: 16,
        fontWeight: 'bold',
        backgroundColor: 'white'
    },
    paginationContainer: {
        flexDirection: 'row',
        justifyContent: 'center',
        backgroundColor: 'white'
    },
    paginationButtons: {
        backgroundColor: '#e3e1d3',
        flexDirection: 'row',
        justifyContent: 'center',
        borderRadius: 3,
        height: 30,
        width: 'auto',
        
    },
    paginationText: {
        margin: 5,
        alignContent: 'center'
    }

});