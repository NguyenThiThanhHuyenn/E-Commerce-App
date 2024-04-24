from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter





router = DefaultRouter()
router.register('store', views.StoreViewSet)
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

urlpatterns = [
    path('', include(router.urls)),
]