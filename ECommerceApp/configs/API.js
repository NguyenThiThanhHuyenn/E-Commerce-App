import axios from "axios";

export const HOST = 'http://192.168.1.2:8000';

export const endpoints ={
    'categories': '/categories/',
    'store': '/store/',
    'products': '/products/',
    '/products/{product_id}/': '/products/{product_id}/',
    'product-images': `/product-images/{product_id}//`,
    'login': '/o/token/',
    'current-user': '/user/current_user/',
    'register': '/user/',
    'reviews-by-product': '/review/{product_id}//',
    'reviews-by-store': '/review/{store_id}//'
};

//Hàm tiện ích để kiểm tra và cắt bỏ phần "/api" nếu có
const processUrl = (url) => {
    if (url.startsWith('/api')) {
        return url.slice(4); // Cắt bỏ 4 ký tự đầu tiên (/api)
    }
    return url;
};

export const authApi = (accessToken) => axios.create({
        baseURL: HOST,
        headers: {
            "Authorization": `Bearer ${accessToken}`
        }
    });

// Tạo instance axios mặc định và xử lý các URL trước khi gửi yêu cầu
const instance = axios.create({
    baseURL: HOST,
    transformRequest: [(data, headers) => {
        if (headers.url) {
            headers.url = processUrl(headers.url); // Xử lý URL trước khi gửi yêu cầu
        }
        return data;
    }]
});

export default instance;
