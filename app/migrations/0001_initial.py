# Generated by Django 3.1.1 on 2021-04-16 02:59

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total', models.PositiveIntegerField(default=0, verbose_name='Số lượng')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Ngày tạo')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
            ],
        ),
        migrations.CreateModel(
            name='CategoryHero',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('description', models.TextField(verbose_name='Mô tả')),
            ],
        ),
        migrations.CreateModel(
            name='CategoryItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
            ],
        ),
        migrations.CreateModel(
            name='CategoryNew',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
            ],
        ),
        migrations.CreateModel(
            name='Skill',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('image', models.ImageField(upload_to='ability', verbose_name='Hình ảnh')),
                ('ability', models.CharField(max_length=100, verbose_name='Khả năng')),
                ('description', models.TextField(verbose_name='Mô tả')),
                ('affects', models.CharField(max_length=100, verbose_name='Ảnh hưởng')),
                ('type_damage', models.CharField(max_length=50, verbose_name='Kiểu sát thương')),
                ('cooldown', models.CharField(max_length=50, verbose_name='Hồi chiêu')),
            ],
        ),
        migrations.CreateModel(
            name='Stat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('health', models.CharField(max_length=50, verbose_name='Máu')),
                ('health_regen', models.CharField(max_length=50, verbose_name='Máu hồi phục')),
                ('mana', models.CharField(max_length=50, verbose_name='Năng lượng')),
                ('mana_regen', models.CharField(max_length=50, verbose_name='Năng lượng hồi phục')),
                ('armor', models.CharField(max_length=50, verbose_name='Giáp')),
                ('magic_resistance', models.CharField(max_length=50, verbose_name='Kháng phép')),
                ('damage', models.CharField(max_length=50, verbose_name='Sát thương vật lí')),
                ('magic', models.CharField(max_length=50, verbose_name='Sức mạnh phép thuật')),
                ('move_speed', models.CharField(max_length=50, verbose_name='Tốc độ di chuyển')),
                ('att_speed', models.CharField(max_length=50, verbose_name='Tốc độ tấn công')),
                ('att_range', models.CharField(max_length=50, verbose_name='Phạm vi tấn công')),
                ('vision_range', models.CharField(max_length=50, verbose_name='Tầm nhìn(Ngày/Đêm)')),
            ],
        ),
        migrations.CreateModel(
            name='Value',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('image', models.ImageField(upload_to='products', verbose_name='Hình ảnh')),
                ('marked_price', models.PositiveIntegerField(verbose_name='Giá cũ')),
                ('selling_price', models.PositiveIntegerField(verbose_name='Giá mới')),
                ('description', models.TextField(verbose_name='Mô tả')),
                ('view_count', models.PositiveIntegerField(default=0, verbose_name='Lượt xem')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.category', verbose_name='Phân loại')),
                ('value', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.value', verbose_name='Giá trị')),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ordered_by', models.CharField(max_length=200, verbose_name='Người đặt hàng')),
                ('mobile', models.CharField(max_length=10, verbose_name='Số điện thoại')),
                ('email', models.EmailField(blank=True, max_length=254, null=True, verbose_name='Email')),
                ('subtotal', models.PositiveIntegerField(verbose_name='Tổng tiền')),
                ('discount', models.PositiveIntegerField(verbose_name='Giảm giá')),
                ('total', models.PositiveIntegerField(verbose_name='Số lượng')),
                ('order_status', models.CharField(choices=[('Đơn hàng đã nhận', 'Đơn hàng đã nhận'), ('Xử lý đơn hàng', 'Xử lý đơn hàng'), ('Đang gửi', 'Đang gửi'), ('Đơn hàng đã hoàn thành', 'Đơn hàng đã hoàn thành'), ('Đơn hàng đã bị hủy', 'Đơn hàng đã bị hủy')], max_length=50, verbose_name='Trạng thái đơn hàng')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Ngày tạo')),
                ('cart', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='app.cart', verbose_name='Mã giỏ hàng')),
            ],
        ),
        migrations.CreateModel(
            name='New',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('image', models.ImageField(upload_to='news', verbose_name='Hình ảnh')),
                ('description', models.TextField(verbose_name='Nội dung')),
                ('view_count', models.PositiveIntegerField(default=0, verbose_name='Lượt xem')),
                ('categorynew', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.categorynew', verbose_name='Phân loại')),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('image', models.ImageField(upload_to='items', verbose_name='Hình ảnh')),
                ('description', models.TextField(verbose_name='Mô tả')),
                ('price', models.PositiveIntegerField(verbose_name='Giá tiền')),
                ('cooldown', models.CharField(max_length=50, verbose_name='Hồi chiêu')),
                ('view_count', models.PositiveIntegerField(default=0, verbose_name='Lượt xem')),
                ('categoryitem', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.categoryitem', verbose_name='Phân loại')),
            ],
        ),
        migrations.CreateModel(
            name='Hero',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Mã')),
                ('slug', models.SlugField(unique=True, verbose_name='Tên')),
                ('image', models.ImageField(upload_to='heroes', verbose_name='Hình ảnh')),
                ('aliases', models.CharField(max_length=100, verbose_name='Biệt danh')),
                ('speech', models.CharField(max_length=200, verbose_name='Lời thoại')),
                ('description', models.TextField(verbose_name='Truyền thuyết')),
                ('view_count', models.PositiveIntegerField(default=0, verbose_name='Lượt xem')),
                ('categoryhero', models.ManyToManyField(to='app.CategoryHero', verbose_name='Phân loại')),
                ('skill', models.ManyToManyField(to='app.Skill', verbose_name='Kỹ năng')),
                ('stat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.stat', verbose_name='Thông số')),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=200, verbose_name='Họ và tên')),
                ('address', models.CharField(blank=True, max_length=200, null=True, verbose_name='Địa chỉ')),
                ('joined_on', models.DateTimeField(auto_now_add=True, verbose_name='Ngày tham gia')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Tên người dùng')),
            ],
        ),
        migrations.CreateModel(
            name='CartProduct',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rate', models.PositiveIntegerField(verbose_name='Giá tiền')),
                ('quantity', models.PositiveIntegerField(verbose_name='Số lượng')),
                ('subtotal', models.PositiveIntegerField(verbose_name='Tổng tiền')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.cart', verbose_name='Mã giỏ hàng')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.product', verbose_name='Mã sản phẩm')),
            ],
        ),
        migrations.AddField(
            model_name='cart',
            name='customer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.customer', verbose_name='Mã người dùng'),
        ),
    ]
