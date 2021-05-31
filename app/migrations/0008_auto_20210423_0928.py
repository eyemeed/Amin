# Generated by Django 3.1.1 on 2021-04-23 02:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_staff'),
    ]

    operations = [
        migrations.AlterField(
            model_name='stat',
            name='armor',
            field=models.CharField(max_length=100, verbose_name='Giáp'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='att_range',
            field=models.CharField(max_length=100, verbose_name='Phạm vi tấn công'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='att_speed',
            field=models.CharField(max_length=100, verbose_name='Tốc độ tấn công'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='damage',
            field=models.CharField(max_length=100, verbose_name='Sát thương vật lí'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='health',
            field=models.CharField(max_length=100, verbose_name='Máu'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='health_regen',
            field=models.CharField(max_length=100, verbose_name='Máu hồi phục'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='magic',
            field=models.CharField(max_length=100, verbose_name='Sức mạnh phép thuật'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='magic_resistance',
            field=models.CharField(max_length=100, verbose_name='Kháng phép'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='mana',
            field=models.CharField(max_length=100, verbose_name='Năng lượng'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='mana_regen',
            field=models.CharField(max_length=100, verbose_name='Năng lượng hồi phục'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='move_speed',
            field=models.CharField(max_length=100, verbose_name='Tốc độ di chuyển'),
        ),
        migrations.AlterField(
            model_name='stat',
            name='vision_range',
            field=models.CharField(max_length=100, verbose_name='Tầm nhìn(Ngày/Đêm)'),
        ),
    ]
