from rest_framework import serializers
from rest_framework.serializers import ModelSerializer, HyperlinkedModelSerializer
from .models import *

class UserSerializer(HyperlinkedModelSerializer):
    new_password = serializers.CharField(write_only=True, required=False)
    avatar_url = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'address', 'phone_number', 'role', 'new_password', 'avatar_url', 'is_active']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        if user.role == User.SELLER_ROLE:
            user.is_active = False
        else:
            user.is_active = True
        user.save()
        return user

    def get_avatar_url(self, obj):
        if obj.avatar:
            return obj.avatar.url
        return None


class StoreSerializer(HyperlinkedModelSerializer):
    wallpaper_url = serializers.SerializerMethodField()

    class Meta:
        model = Store
        fields = ["id", "user", "store_name", "wallpaper", "wallpaper_url", "description", "created_at", "updated_at"]

    def get_wallpaper_url(self, obj):
        if obj.wallpaper:
            return obj.wallpaper.url
        return None


class CategorySerializer(HyperlinkedModelSerializer):
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = ['id', 'name', 'parent', 'image', 'image_url']

    def get_image_url(self, obj):
        if obj.image:
            return obj.image.url
        return None



class ReviewSerializer(ModelSerializer):
    class Meta:
        model = Review
        fields = ['id', 'user', 'product', 'store', 'rating', 'comment', 'created_at', 'updated_at']


class ProductSerializer(ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'store', 'category', 'product_name', 'price', 'description', 'stock', 'created_at', 'updated_at']

class ProductImageSerializer(HyperlinkedModelSerializer):
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = ProductImage
        fields = ['id', 'product', 'image', 'image_url', 'created_at', 'updated_at']


    def get_image_url(self, obj):
        if obj.image:
            return obj.image.url
        return None

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'


class OrderDetailSerializer(ModelSerializer):
    class Meta:
        model = OrderDetail
        fields = ['id', 'order', 'product', 'quantity', 'price', 'order']

class PaymentSerializer(ModelSerializer):
    class Meta:
        model = Payment
        fields = ['id', 'order', 'payment_method', 'amount', 'payment_date', 'transaction_id']




