from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.conf import settings

# Create your models here.

class Staff(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=50)
    image = models.ImageField(upload_to="static/img/staff")
    mobile = models.CharField(max_length=20)

    def __str__(self):
        return self.user.username


class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name='Tên người dùng')
    full_name = models.CharField(max_length=200, verbose_name='Họ và tên')
    address = models.CharField(max_length=200, null=True, blank=True, verbose_name='Địa chỉ')
    joined_on = models.DateTimeField(auto_now_add=True, verbose_name='Ngày tham gia')

    def __str__(self):
        return self.full_name

class Category(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')

    def __str__(self):
        return self.title

class Value(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')

    def __str__(self):
        return self.title

class Product(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='Phân loại')
    value = models.ForeignKey(Value, on_delete=models.CASCADE, verbose_name='Giá trị')
    image = models.ImageField(upload_to="static/img/products", verbose_name='Hình ảnh')
    selling_price = models.PositiveIntegerField(verbose_name='Giá')
    description = models.TextField(verbose_name='Mô tả')
    view_count = models.PositiveIntegerField(default=0, verbose_name='Lượt xem')

    def __str__(self):
        return self.title

class Cart(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Mã người dùng')
    total = models.PositiveIntegerField(default=0, verbose_name='Số lượng')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Ngày tạo')

    def __str__(self):
        return "Cart: " + str(self.id)

class CartProduct(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, verbose_name='Mã giỏ hàng')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name='Mã sản phẩm')
    rate = models.PositiveIntegerField(verbose_name='Giá tiền')
    quantity = models.PositiveIntegerField(verbose_name='Số lượng')
    subtotal = models.PositiveIntegerField(verbose_name='Tổng tiền')

    def __str__(self):
        return "Cart: " + str(self.cart.id) + " CartProduct: " + str(self.id)

ORDER_STATUS = (
    ("Đang xử lý", "Đang xử lý"),
    ("Đang gửi", "Đang gửi"),
    ("Đã nhận", "Đã nhận"),
    ("Hoàn thành", "Hoàn thành"),
    ("Đã bị hủy", "Đã bị hủy"),
)

class Order(models.Model):
    cart = models.OneToOneField(Cart, on_delete=models.CASCADE, verbose_name='Mã giỏ hàng')
    ordered_by = models.CharField(max_length=200, verbose_name='Người đặt hàng')
    mobile = models.CharField(max_length=10, verbose_name='Số điện thoại')
    email = models.EmailField(null=True, blank=True, verbose_name='Email')
    subtotal = models.PositiveIntegerField(verbose_name='Tổng tiền')
    discount = models.PositiveIntegerField(verbose_name='Giảm giá')
    total = models.PositiveIntegerField(verbose_name='Tổng tiền')
    order_status = models.CharField(max_length=50, choices=ORDER_STATUS, verbose_name='Trạng thái đơn hàng')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Ngày tạo')

    def __str__(self):
        return "Order: " + str(self.id)

class CategoryHero(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    description = models.TextField(verbose_name='Mô tả')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("category_detail", kwargs={"slug": self.slug})

class Stat(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    health = models.CharField(max_length=100, verbose_name='Máu')
    health_regen = models.CharField(max_length=100, verbose_name='Máu hồi phục')
    mana = models.CharField(max_length=100, verbose_name='Năng lượng')
    mana_regen = models.CharField(max_length=100, verbose_name='Năng lượng hồi phục')
    armor = models.CharField(max_length=100, verbose_name='Giáp')
    magic_resistance = models.CharField(max_length=100, verbose_name='Kháng phép')
    damage = models.CharField(max_length=100, verbose_name='Sát thương vật lí')
    magic = models.CharField(max_length=100, verbose_name='Sức mạnh phép thuật')
    move_speed = models.CharField(max_length=100, verbose_name='Tốc độ di chuyển')
    att_speed = models.CharField(max_length=100, verbose_name='Tốc độ tấn công')
    att_range = models.CharField(max_length=100, verbose_name='Phạm vi tấn công')
    vision_range = models.CharField(max_length=100, verbose_name='Tầm nhìn(Ngày/Đêm)')

    def __str__(self):
        return self.title

class Skill(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    image = models.ImageField(upload_to="static/img/ability", verbose_name='Hình ảnh')
    ability = models.CharField(max_length=100, verbose_name='Khả năng')
    description = models.TextField(verbose_name='Mô tả')
    affects = models.CharField(max_length=100, verbose_name='Ảnh hưởng')
    type_damage = models.CharField(max_length=50, verbose_name='Kiểu sát thương')
    cooldown = models.CharField(max_length=50, verbose_name='Hồi chiêu')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("skill_detail", kwargs={"slug": self.slug})

class Hero(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    categoryhero = models.ManyToManyField(CategoryHero, verbose_name='Phân loại')
    stat = models.ForeignKey(Stat, on_delete=models.CASCADE, verbose_name='Thông số')
    skill = models.ManyToManyField(Skill, verbose_name='Kỹ năng')
    image = models.ImageField(upload_to="static/img/heroes", verbose_name='Hình ảnh')
    aliases = models.CharField(max_length=100, verbose_name='Biệt danh')
    speech = models.CharField(max_length=200, verbose_name='Lời thoại')
    description = models.TextField(verbose_name='Truyền thuyết')
    view_count = models.PositiveIntegerField(default=0, verbose_name='Lượt xem')

    def __str__(self):
        return self.title

class CategoryItem(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')

    def __str__(self):
        return self.title

class Item(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    categoryitem = models.ForeignKey(CategoryItem, on_delete=models.CASCADE, verbose_name='Phân loại')
    image = models.ImageField(upload_to="static/img/items", verbose_name='Hình ảnh')
    description = models.TextField(verbose_name='Mô tả')
    price = models.PositiveIntegerField(verbose_name='Giá tiền')
    cooldown = models.CharField(max_length=50, verbose_name='Hồi chiêu')
    view_count = models.PositiveIntegerField(default=0, verbose_name='Lượt xem')

    def __str__(self):
        return self.title

class CategoryNew(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')

    def __str__(self):
        return self.title

class New(models.Model):
    title = models.CharField(max_length=200, verbose_name='Tên')
    slug = models.SlugField(unique=True, verbose_name='Mã')
    categorynew = models.ForeignKey(CategoryNew, on_delete=models.CASCADE, verbose_name='Phân loại')
    image = models.ImageField(upload_to="static/img/news", verbose_name='Hình ảnh')
    description = models.TextField(verbose_name='Nội dung')
    view_count = models.PositiveIntegerField(default=0, verbose_name='Lượt xem')

    def __str__(self):
        return self.title