import axios from "axios";

export const HOST = 'https://2e09-14-241-246-38.ngrok-free.app';

export const endpoints = {
    'categories': '/categories/',
    'store': '/store/{store_id}/',
    'create-store': '/store/',
    'store-by-user': '/store-user/{user_id}/',
    'products': '/products/',
    '/products/{product_id}/': '/products/{product_id}/',
    'product-images': `/product-images/item/{product_id}/`,
    'add-product-images': '/product-images/',
    'login': '/o/token/',
    'current-user': '/user/current_user/',
    'register': '/user/',
    'review': '/review/',
    'reviews-by-product': '/review-products/{product_id}/',
    'reviews-by-store': '/review-store/{store_id}/',
    'products-by-category': '/products-category/{category_id}/',
    'products-by-store': '/products-store/{store_id}/',
    'productvariants': '/productvariants/',
    'productvariants-by-product': '/productvariants-product/{product_id}/',
    'similar-products': '/similar-products/?product_id={product_id}',
    'order-detail': '/order-detail/',
    'remove-order-detail': '/order-detail/{id}/',
    'update-order-detail': '/order-detail/{id}/',
    'create-order': '/order/',
    'create-payment': '/payment/',
    'order-by-user': '/order-by-user/?user_id={user_id}/',
    'get-order': '/order/{id}/',
    'update-order': '/order/{id}/',
    'patch-order': '/order/{id}/',
    'pending-order-details': '/pending-order-details/?user_id={user_id}/',
    'seller-statistics': '/seller-statistics/?user_id={user_id}/'

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
