from rest_framework.serializers import ModelSerializer
from .models import *

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'username', 'password', 'avatar', 'address', 'phone_number', 'role']
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user

class StoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = ["id", "user", "store_name", "wallpaper", "description", "created_at",
                  "updated_at"]

class CategorySerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'parent', 'image']


class ReviewSerializer(ModelSerializer):
    class Meta:
        model = Review
        fields = ['id', 'user', 'product', 'store', 'rating', 'comment', 'created_at', 'updated_at']


class ProductSerializer(ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'store', 'category', 'product_name', 'price', 'description', 'stock', 'created_at', 'updated_at']

class ProductImageSerializer(ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['id', 'product', 'image', 'created_at', 'updated_at']

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




