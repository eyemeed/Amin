# Generated by Django 3.2.2 on 2021-05-18 13:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0009_comment'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Comment',
        ),
    ]