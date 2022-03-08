from django.urls import path

from . import views

app_name = 'product'
urlpatterns = [
    path('products/', views.product, name='all_product'),
    path('product-detail/<int:product_id>/', views.detail_product, name='product-detail')
]
