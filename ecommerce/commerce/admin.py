from django.contrib import admin
from django.contrib.auth.models import Permission
from django.template.response import TemplateResponse
from django.utils.html import mark_safe
from .models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path
from django.db.models.functions import TruncMonth, TruncQuarter, TruncYear, ExtractMonth, ExtractQuarter, ExtractYear
from django.db.models import Count, Sum, Q, F


# class UserAdmin(admin.ModelAdmin):
#     list_display = ["id", "username", "active", "store"]
#     search_fields = ["id", "username", "store__store_name"]

class CategoryAdmin(admin.ModelAdmin):
    list_display = ["id", "name", "parent"]
    search_fields = ["parent__name", "name"]

class StoreAdmin(admin.ModelAdmin):
    list_display = ["id", "store_name", "user", "active", "average_rating"]
    search_fields = ["store_name", "user__username"]
    readonly_fields = ['store_wallpaper']

    def store_wallpaper(self, store):
        if store.wallpaper:
            return mark_safe('<img src="/static/{url}" width="450" height="120" />'.format(url=store.wallpaper.name))



class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1
    readonly_fields = ['preview_image']

    def preview_image(self, product):
        if product.image:
            return mark_safe('<img src="/static/{url}" width="120" height="120" />'.format(url=product.image.name))
        else:
            return "No image selected"

class ProductForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)
    class Meta:
        model = Product
        fields = '__all__'

class ProductAdmin(admin.ModelAdmin):
    list_display = ["id", "product_name", "category", "store", "price", "stock", "average_rating"]
    search_fields = ["product_name", "category__name", "store__store_name"]
    inlines = [ProductImageInline]
    form = ProductForm

class CommerceAppAdminSite(admin.AdminSite):
    site_header = 'HE THONG QUAN LY SAN GIAO DICH THUONG MAI DIEN TU'

    def get_urls(self):
        return [
            path('commerce-stats/', self.commerce_stats)

        ] + super().get_urls()

    def commerce_stats(self, request):
        if request.user.role == 'seller':
            # Người bán
            monthly_sales = Order.objects.filter(store__user=request.user, order_status='completed').annotate(
                month=TruncMonth('order_date')).values(
                'month').annotate(total_sales=Sum('total_amount')).order_by('month')

            quarterly_sales = Order.objects.filter(store__user=request.user, order_status='completed').annotate(
                quarter=TruncQuarter('order_date')).values('quarter').annotate(
                total_sales=Sum('total_amount')).order_by('quarter')

            yearly_sales = Order.objects.filter(store__user=request.user, order_status='completed').annotate(
                year=TruncYear('order_date')).values(
                'year').annotate(total_sales=Sum('total_amount')).order_by('year')

            stock_products = Product.objects.filter(store__user=request.user).annotate(
                total_sold=Sum('orderdetail__quantity')
            ).annotate(
                stocks=F('stock') - F('total_sold')
            )

            return TemplateResponse(request, 'admin/seller-commerce-stats.html', {
                'monthly_sales': monthly_sales,
                'quarterly_sales': quarterly_sales,
                'yearly_sales': yearly_sales,
                'stock_products': stock_products
            })
        elif request.user.is_superuser:
            # Người quản trị sàn giao dịch
            store_count = Store.objects.count()
            active_store_count = Store.objects.filter(active=True).count()
            # Tính số lượng sản phẩm hoạt động cho mỗi cửa hàng
            store_active_products = []
            for store in Store.objects.all():
                active_product_count = store.product_set.filter(active=True).count()
                store_active_products.append({
                    'store_name': store.store_name,
                    'active_product_count': active_product_count
                })
            store_sales = Store.objects.annotate(
                monthly_sales=Sum('order__total_amount', filter=Q(order__order_status='completed',
                                                                  order__order_date__month=ExtractMonth(
                                                                      'order__order_date'))),
                quarterly_sales=Sum('order__total_amount', filter=Q(order__order_status='completed',
                                                                    order__order_date__quarter=ExtractQuarter(
                                                                        'order__order_date'))),
                yearly_sales=Sum('order__total_amount', filter=Q(order__order_status='completed',
                                                                 order__order_date__year=ExtractYear(
                                                                     'order__order_date')))
            )

            total_monthly_sales = Order.objects.filter(order_status='completed').annotate(
                month=TruncMonth('order_date')).values(
                'month').annotate(total_sales=Sum('total_amount')).order_by('month')

            total_quarterly_sales = Order.objects.filter(order_status='completed').annotate(
                quarter=TruncQuarter('order_date')).values('quarter').annotate(
                total_sales=Sum('total_amount')).order_by('quarter')

            total_yearly_sales = Order.objects.filter(order_status='completed').annotate(
                year=TruncYear('order_date')).values(
                'year').annotate(total_sales=Sum('total_amount')).order_by('year')

            return TemplateResponse(request, 'admin/admin-commerce-stats.html', {
                'store_sales': store_sales,
                'total_monthly_sales': total_monthly_sales,
                'total_quarterly_sales': total_quarterly_sales,
                'total_yearly_sales': total_yearly_sales,
                'store_count': store_count,
                'active_store_count': active_store_count,
                'store_active_products': store_active_products

            })




class OrderAdmin(admin.ModelAdmin):
    list_display = ["id", "user", "store", "order_date", "total_amount", "payment_method", "order_status"]
    search_fields = ["user__username", "store__store_name", "order_status"]
    list_filter = ["order_status", "payment_method"]



class OrderDetailAdmin(admin.ModelAdmin):
    list_display = ["id", "order", "product", "quantity", "price"]
    search_fields = ["order__id", "product__product_name"]



class PaymentAdmin(admin.ModelAdmin):
    list_display = ["id", "order", "payment_method", "amount", "payment_date"]
    search_fields = ["order__id", "payment_method"]
    list_filter = ["payment_method"]

class ReviewAdmin(admin.ModelAdmin):
    list_display = ["id", "user", "product", "store", "rating", "comment", "created_at", "active"]
    search_fields = ["user__username", "product__product_name", "store__store_name"]
    list_filter = ["active"]

# admin_site = CommerceAppAdminSite('ecommerce')
# admin_site.register(Review, ReviewAdmin)
# admin_site.register(OrderDetail, OrderDetailAdmin)
# admin_site.register(Order, OrderAdmin)
# admin_site.register(Payment, PaymentAdmin)
# admin.site.register(User, UserAdmin)
# admin_site.register(Category, CategoryAdmin)
# admin_site.register(Store, StoreAdmin)
# admin_site.register(Product, ProductAdmin
admin.site.register(Review, ReviewAdmin)
admin.site.register(OrderDetail, OrderDetailAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(Payment, PaymentAdmin)
admin.site.register(User)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Store, StoreAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Permission)

