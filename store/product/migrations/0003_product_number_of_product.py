# Generated by Django 4.0.3 on 2022-03-08 08:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_alter_product_description_alter_product_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='number_of_product',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
