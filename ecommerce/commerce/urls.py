from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter





router = DefaultRouter()
router.register('store', views.StoreViewSet)
router.register(r'store-user/(?P<user_id>\d+)/', views.StoreByUserViewSet, basename='store-by-user')
router.register('products', views.ProductViewSet, basename='product')
router.register('product-images', views.ProductImageViewSet, basename='product-image')
router.register('order', views.OrderViewSet, basename='order')
router.register('order-detail', views.OrderDetailViewSet, basename='order-detail')
router.register('payment', views.PaymentViewSet, basename='payment')
router.register('similar-products', views.SimilarProductViewSet, basename='similar-products')
router.register('seller-statistics', views.SellerStatisticsViewSet, basename='seller-statistics')
router.register('admin-statistics', views.AdminStatisticsViewSet, basename='admin-statistics')
router.register('categories', views.CategoryViewSet)
router.register(r'products/(?P<category_id>\d+)/', views.ProductByCategoryViewSet, basename='products-by-category')
router.register('user', views.UserViewSet)
router.register('review', views.ReviewViewSet)
router.register(r'review/(?P<product_id>\d+)/', views.ReviewsByProductViewSet, basename='reviews-by-product')
router.register(r'review-store/(?P<store_id>\d+)/', views.ReviewsByStoreViewSet, basename='reviews-by-store')
router.register(r'product-images/(?P<product_id>\d+)/', views.ImageByProductId, basename='image-by-product')
router.register(r'products-store/(?P<store_id>\d+)/', views.ProductByStoreViewSet, basename='products-by-store')

urlpatterns = [
    path('', include(router.urls)),
]