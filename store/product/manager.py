from django.db import models


class CountProductsManager(models.Manager):
    def count_product(self):
        number = 10
        return self.filter(number_of_product__gte=number)
