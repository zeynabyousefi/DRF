from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import *
from .serializers import *


@api_view(['GET', 'POST'])
def product(request):
    if request.method == 'POST':
        name = request.data['name']
        return Response({"name": f'my name is {name}'})
    else:
        return Response({"name": 'my name is zeynab'})


@api_view()
def product(request):
    products = Product.count_objects.count_product()
    ser_data = ProductSerializer(products, many=True)
    return Response(ser_data.data)


@api_view()
@permission_classes([IsAuthenticated, ])
def detail_product(request, product_id):
    product_obj = Product.objects.get(pk=product_id)
    ser_data = ProductSerializer(product_obj)
    return Response(ser_data.data)
