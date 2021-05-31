from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(
    [Staff, Customer, Category, Value, Product, Cart, CartProduct, Order, CategoryHero, Stat, Skill, Hero, CategoryItem, Item, CategoryNew, New])
