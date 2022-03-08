from rest_framework import serializers


class ProductSerializer(serializers.Serializer):
    category = serializers.CharField(max_length=20)
    name = serializers.CharField(max_length=200)
    # slug = serializers.SlugField(max_length=200, unique=True)
    description = serializers.CharField()
    price = serializers.IntegerField()
    available = serializers.BooleanField()
    number_of_product = serializers.IntegerField()
    created = serializers.DateTimeField()
    updated = serializers.DateTimeField()
