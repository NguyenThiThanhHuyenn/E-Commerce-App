from django.db.models import Q, Sum, Count
from datetime import datetime
from django.http import HttpResponse
from rest_framework import viewsets, permissions, generics, status
from rest_framework.decorators import action, api_view
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser

from .models import *
from .serializers import UserSerializer, StoreSerializer, CategorySerializer, ProductSerializer, ProductImageSerializer, ReviewSerializer, OrderSerializer, OrderDetailSerializer, PaymentSerializer
# Create your views here.

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == 'current_user':
            return [permissions.IsAuthenticated()]
        elif self.action == 'create':
            return [permissions.AllowAny()]
        elif self.action == 'update_current_user':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(detail=False, methods=['get'])
    def current_user(self, request):
        serializer = self.get_serializer(request.user)
        return Response(serializer.data)

    @action(detail=False, methods=['put'])
    def update_current_user(self, request):
        serializer = self.get_serializer(request.user, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        # Update user information
        user = serializer.save()

        # Update password if new_password provided
        new_password = request.data.get('new_password')
        if new_password:
            user.set_password(new_password)
            user.save()
            return Response({'message': 'Password updated successfully.'}, status=status.HTTP_200_OK)

        return Response(serializer.data)



class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.filter(active=True)
    serializer_class = StoreSerializer

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductSerializer
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['product_name', 'price', 'store__store_name', 'category__name']
    ordering_fields = ['product_name', 'price']

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]


class ProductByStoreViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = ProductSerializer

    def get_queryset(self):
        store_id = self.kwargs.get('store_id')
        if store_id:
            return Product.objects.filter(store_id=store_id)
        return Product.objects.none()

class ProductByCategoryViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = ProductSerializer

    def get_queryset(self):
        category_id = self.kwargs.get('category_id')
        if category_id:
            return Product.objects.filter(category_id=category_id)
        return Product.objects.none()

class SimilarProductViewSet(viewsets.ViewSet):
    def list(self, request):
        product_id = request.query_params.get('product_id')
        if product_id:
            try:
                product = Product.objects.get(id=product_id)
                similar_products = Product.objects.filter(
                    Q(category=product.category) | Q(product_name__icontains=product.product_name)
                ).exclude(id=product_id)[:5]
                # Lấy 5 sản phẩm cùng loại hoặc tên gần giống, loại trừ sản phẩm hiện tại
                serializer_class = ProductSerializer(similar_products, many=True)
                return Response(serializer_class.data)
            except Product.DoesNotExist:
                return Response({"message": "Product not found."}, status=404)
        else:
            return Response({"message": "Product ID is required."}, status=400)


class ProductImageViewSet(viewsets.ModelViewSet):
    queryset = ProductImage.objects.all()
    serializer_class = ProductImageSerializer


    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

class ImageByProductId(viewsets.ReadOnlyModelViewSet):
    serializer_class = ProductImageSerializer

    def get_queryset(self):
        product_id = self.kwargs.get('product_id')
        if product_id:
            return ProductImage.objects.filter(product_id=product_id)
        return ProductImage.objects.none()


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.filter(active=True)
    serializer_class = CategorySerializer

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.filter(active=True)
    serializer_class = ReviewSerializer

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

class ReviewsByProductViewSet(viewsets.ViewSet):
    permission_classes = [permissions.AllowAny]  # Có thể điều chỉnh quyền truy cập ở đây

    def list(self, request, product_id):
        reviews = Review.objects.filter(product_id=product_id)
        serializer = ReviewSerializer(reviews, many=True)
        return Response(serializer.data)

class ReviewsByStoreViewSet(viewsets.ViewSet):
    permission_classes = [permissions.AllowAny]  # Có thể điều chỉnh quyền truy cập ở đây

    def list(self, request, store_id):
        reviews = Review.objects.filter(store_id=store_id)
        serializer = ReviewSerializer(reviews, many=True)
        return Response(serializer.data)

class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated()]

class OrderDetailViewSet(viewsets.ModelViewSet):
    queryset = OrderDetail.objects.all()
    serializer_class = OrderDetailSerializer
    permission_classes = [permissions.IsAuthenticated()]


class PaymentViewSet(viewsets.ModelViewSet):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer
    permission_classes = [permissions.IsAuthenticated()]

class SellerStatisticsViewSet(viewsets.ViewSet):
    permission_classes = [permissions.IsAuthenticated()]

    def list(self, request):
        user = request.user  # Người dùng đang thực hiện yêu cầu
        store = Store.objects.get(user=user)  # Cửa hàng của người bán

        # Thống kê doanh thu từng mặt hàng theo tháng, quý và năm
        monthly_revenue = self.get_revenue_by_period(store, 'month')
        quarterly_revenue = self.get_revenue_by_period(store, 'quarter')
        yearly_revenue = self.get_revenue_by_period(store, 'year')

        # Tổng doanh thu cửa hàng của người bán
        total_revenue = OrderDetail.objects.filter(order__store=store).aggregate(total=Sum('price'))['total']

        # Số lượng bán ra của từng mặt hàng
        product_sales = OrderDetail.objects.filter(order__store=store).values('product__product_name').annotate(
            total_sales=Sum('quantity'))

        return Response({
            'monthly_revenue': monthly_revenue,
            'quarterly_revenue': quarterly_revenue,
            'yearly_revenue': yearly_revenue,
            'total_revenue': total_revenue,
            'product_sales': product_sales
        })

    def get_revenue_by_period(self, store, period):
        today = datetime.now()
        if period == 'month':
            return OrderDetail.objects.filter(order__store=store, order__order_date__month=today.month,
                                               order__order_date__year=today.year).aggregate(total=Sum('price'))['total']
        elif period == 'quarter':
            quarter = (today.month - 1) // 3 + 1
            return OrderDetail.objects.filter(order__store=store, order__order_date__quarter=quarter,
                                               order__order_date__year=today.year).aggregate(total=Sum('price'))['total']
        elif period == 'year':
            return OrderDetail.objects.filter(order__store=store, order__order_date__year=today.year).aggregate(
                total=Sum('price'))['total']


class AdminStatisticsViewSet(viewsets.ViewSet):
    permission_classes = [permissions.IsAdminUser()]  # Xác thực người dùng là quản trị viên

    def list(self, request):
        # Thống kê tần suất đơn hàng theo trạng thái
        order_frequency = Order.objects.values('store__store_name', 'order_status').annotate(
            total_orders=Count('id'))

        # Tổng doanh thu của từng cửa hàng theo tháng, quý và năm
        monthly_revenue = self.get_revenue_by_period('month')
        quarterly_revenue = self.get_revenue_by_period('quarter')
        yearly_revenue = self.get_revenue_by_period('year')

        return Response({
            'order_frequency': order_frequency,
            'monthly_revenue': monthly_revenue,
            'quarterly_revenue': quarterly_revenue,
            'yearly_revenue': yearly_revenue
        })

    def get_revenue_by_period(self, period):
        today = datetime.now()
        if period == 'month':
            return OrderDetail.objects.filter(order__order_date__month=today.month,
                                               order__order_date__year=today.year).values(
                'order__store__store_name').annotate(total=Sum('price'))
        elif period == 'quarter':
            quarter = (today.month - 1) // 3 + 1
            return OrderDetail.objects.filter(order__order_date__quarter=quarter,
                                               order__order_date__year=today.year).values(
                'order__store__store_name').annotate(total=Sum('price'))
        elif period == 'year':
            return OrderDetail.objects.filter(order__order_date__year=today.year).values(
                'order__store__store_name').annotate(total=Sum('price'))


def index(request):
    return HttpResponse("e-commerce app")
