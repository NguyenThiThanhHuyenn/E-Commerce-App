from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField




class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default=None)
    phone_number = models.CharField(max_length=20)
    address = models.CharField(max_length=255)
    SELLER_ROLE = 'seller'
    CUSTOMER_ROLE = 'customer'
    ROLE_CHOICES = [
        (SELLER_ROLE, 'Seller'),
        (CUSTOMER_ROLE, 'Customer'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES, default=CUSTOMER_ROLE)

    def __str__(self):
        return self.username


class Category(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True)
    image = models.ImageField(upload_to='categoryImage/%Y/%m', default=None)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)


    def __str__(self):
        return self.name


class Review(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    product = models.ForeignKey('Product', on_delete=models.CASCADE, null=True, blank=True)
    store = models.ForeignKey('Store', on_delete=models.CASCADE, null=True, blank=True)
    rating = models.IntegerField(choices=[(i, i) for i in range(1, 6)])
    comment = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        if self.product:
            return f"{self.user.username} - {self.product.product_name}"
        elif self.store:
            return f"{self.user.username} - {self.store.store_name}"

class Store(models.Model):
    user = models.OneToOneField('User', on_delete=models.CASCADE)
    store_name = models.CharField(max_length=255)
    wallpaper = models.ImageField(upload_to='wallpaper/%Y/%m', default=None)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    reviews = models.ManyToManyField('Review', related_name='store_reviews+', blank=True)
    average_rating = models.DecimalField(max_digits=3, decimal_places=2, default=0.0)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.store_name

class Product(models.Model):
    store = models.ForeignKey('Store', on_delete=models.CASCADE)
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, null=True)
    product_name = models.CharField(max_length=255, null=False)
    price = models.DecimalField(max_digits=10, decimal_places=0)
    description = RichTextField()
    stock = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)
    reviews = models.ManyToManyField('Review', related_name='product_reviews+', blank=True)
    average_rating = models.DecimalField(max_digits=3, decimal_places=2, default=0.0)

    def __str__(self):
        return self.product_name



class ProductImage(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='images+')
    image = models.ImageField(upload_to='product/%Y/%m', default=None)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)



class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    store = models.ForeignKey(Store, on_delete=models.CASCADE)
    order_date = models.DateTimeField(auto_now_add=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)

    PAYMENT_METHOD_CHOICES = [
        ('cash_on_delivery', 'Cash on Delivery'),
        ('paypal', 'Paypal'),
        ('stripe', 'Stripe'),
        ('zalopay', 'ZaloPay'),
        ('momo', 'MoMo'),
    ]
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHOD_CHOICES)

    ORDER_STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('processing', 'Processing'),
        ('shipped', 'Shipped'),
        ('completed', 'Completed'),
        ('canceled', 'Canceled'),
    ]
    order_status = models.CharField(max_length=20, choices=ORDER_STATUS_CHOICES)


class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)




class Payment(models.Model):
    order = models.OneToOneField(Order, related_name='payment', on_delete=models.CASCADE)
    payment_method = models.CharField(max_length=20, choices=Order.PAYMENT_METHOD_CHOICES)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_date = models.DateTimeField(auto_now_add=True)
    transaction_id = models.CharField(max_length=255, null=True, blank=True)  # ID giao dịch từ các cổng thanh toán

