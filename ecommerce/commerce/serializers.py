from rest_framework import serializers
from rest_framework.serializers import ModelSerializer, HyperlinkedModelSerializer
from .models import *

class UserSerializer(HyperlinkedModelSerializer):
    avatar = serializers.SerializerMethodField(source='avatar')

    def get_image(self, user):
        request = self.context['request']
        if user.avatar.name.startswith('static/'):
            path = "/%s" % user.avatar.name
        else:
            path = '/static/%s' % (user.avatar)
        return request.build_absolute_uri(path)

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

class StoreSerializer(HyperlinkedModelSerializer):
    wallpaper = serializers.SerializerMethodField(source='wallpaper')

    def get_image(self, store):
        request = self.context['request']
        if store.wallpaper.name.startswith('static/'):
            path = "/%s" % store.wallpaper.name
        else:
            path = '/static/%s' % (store.wallpaper)
        return request.build_absolute_uri(path)
    class Meta:
        model = Store
        fields = ["id", "user", "store_name", "wallpaper", "description", "created_at",
                  "updated_at"]

class CategorySerializer(HyperlinkedModelSerializer):
    image = serializers.SerializerMethodField(source='image')

    def get_image(self, category):
        request = self.context['request']
        if category.image.name.startswith('static/'):
            path = "/%s" % category.image.name
        else:
            path = '/static/%s' % (category.image)
        return request.build_absolute_uri(path)

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

class ProductImageSerializer(HyperlinkedModelSerializer):
    image = serializers.SerializerMethodField(source='image')

    def get_image(self, productImage):
        request = self.context['request']
        if productImage.image.name.startswith('static/'):
            path = "/%s" % productImage.image.name
        else:
            path = '/static/%s' % (productImage.image)
        return request.build_absolute_uri(path)
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




