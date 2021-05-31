from django import forms
from django.db.models import fields
from .models import *


class CheckoutForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ["ordered_by", "mobile", "email"]


class CustomerRegistrationForm(forms.ModelForm):
    username = forms.CharField(widget=forms.TextInput())
    password = forms.CharField(widget=forms.PasswordInput())
    email = forms.CharField(widget=forms.EmailInput())

    class Meta:
        model = Customer
        fields = ["username", "password", "email", "full_name", "address"]

    def clean_username(self):
        uname = self.cleaned_data.get("username")
        if User.objects.filter(username=uname).exists():
            raise forms.ValidationError(
                "Tên người dùng này đã tồn tại!")

        return uname


class CustomerLoginForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput())
    password = forms.CharField(widget=forms.PasswordInput())


class CategoryHeroForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ["title", "slug", "description"]
        widgets = {
            "title": forms.TextInput(attrs={
                "class": "form-control",
                "placeholder": "Mời nhập tên nhóm phân loại..."
            }),
            "slug": forms.TextInput(attrs={
                "class": "form-control",
                "placeholder": "Mời nhập mã tên nhóm phân loại..."
            }),
            "description": forms.Textarea(attrs={
                "class": "form-control",
                "placeholder": "Mời nhập mô tả về nhóm phân loại...",
                "rows": 5
            })
        }


class PasswordForgotForm(forms.Form):
    email = forms.CharField(widget=forms.EmailInput(attrs={
        "class": "form-control",
        "placeholder": "Mời bạn nhập địa chỉ email mà tài khoản đang sử dụng...",
    }))

    def clean_email(self):
        e = self.cleaned_data.get("email")
        if Customer.objects.filter(user__email=e).exists():
            pass
        else:
            raise forms.ValidationError("Không tồn tại tài khoản sử dụng email này!")
        return e



class PasswordResetForm(forms.Form):
    new_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'autocomplete': 'new-password',
        'placeholder': 'Nhập mật khẩu',
    }), label="Mật khẩu mới")
    confirm_new_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'autocomplete': 'new-password',
        'placeholder': 'Nhập lại mật khẩu',
    }), label="Nhập lại mật khẩu")

    def clean_confirm_new_password(self):
        new_password = self.cleaned_data.get("new_password")
        confirm_new_password = self.cleaned_data.get("confirm_new_password")
        if new_password != confirm_new_password:
            raise forms.ValidationError(
                "Mật khẩu nhập lại không đúng!")
        return confirm_new_password
