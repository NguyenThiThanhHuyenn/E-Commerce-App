import { StyleSheet } from "react-native";

export default StyleSheet.create({
    categoryItem: {
        flexDirection: 'column', // Thay đổi hướng của flex thành dọc
        alignItems: 'center',
        paddingHorizontal: 20,
        paddingVertical: 10,
        marginHorizontal: 10,
        marginBottom: 10,
        borderRadius: 10,
    },
    categoryImage: {
        width: 50, // Điều chỉnh kích thước hình ảnh
        height: 50, // Điều chỉnh kích thước hình ảnh
        borderRadius: 50, // Đặt border radius là nửa chiều rộng để tạo hình tròn
    },
    categoryText: {
        fontSize: 16,
        fontWeight: 'bold',
        marginTop: 10, // Khoảng cách từ hình ảnh đến văn bản
    }
});
