from django.shortcuts import render, redirect
from django.views.generic import View, TemplateView, CreateView, UpdateView, FormView, DetailView, ListView
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse_lazy, reverse
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from .utils import password_reset_token
from django.core.mail import send_mail
from django.conf import settings
from .models import *
from .forms import *
import math

# customer

class EcomMixin(object):
    def dispatch(self, request, *args, **kwargs):
        cart_id = request.session.get("cart_id")
        if cart_id:
            cart_obj = Cart.objects.get(id=cart_id)
            if request.user.is_authenticated and request.user.customer:
                cart_obj.customer = request.user.customer
                cart_obj.save()
        return super().dispatch(request, *args, **kwargs)


class HomeView(EcomMixin, TemplateView):
    template_name = 'customer/home.html'


class TutorialView(EcomMixin, TemplateView):
    template_name = 'customer/tutorial.html'


PAGE_SIZE = 24

priceList = [
    {'id': 1, 'name': 'Dưới 50,000đ', 'max': 50000},
    {'id': 2, 'name': 'Từ 50.000đ - 100.000đ', 'min': 50000, 'max': 100000},
    {'id': 3, 'name': 'Từ 100.000đ - 300.000đ', 'min': 100000, 'max': 300000},
    {'id': 4, 'name': 'Từ 300.000đ - 500.000đ', 'min': 300000, 'max': 500000},
    {'id': 5, 'name': 'Trên 500.000đ', 'min': 500000},
]

def AllProductsView(request):
    title = request.GET.get('title', '')
    productList = Product.objects.filter(title__icontains=title)

    categoryId = request.GET.get('categoryId')    
    categoryId = int(categoryId) if categoryId else None
    if categoryId:
        productList = productList.filter(category__id=categoryId)

    valueId = request.GET.get('valueId')
    valueId = int(valueId) if valueId else None
    if valueId:
        productList = productList.filter(value__id=valueId)

    priceId = request.GET.get('priceId')
    priceId = int(priceId) if priceId else None
    price = priceList[priceId-1] if priceId else {}
    minPrice, maxPrice = price.get('min'), price.get('max')

    if minPrice: 
        productList = productList.filter(selling_price__gte=minPrice)

    if maxPrice:
        productList = productList.filter(selling_price__lte=maxPrice)

    page = request.GET.get('page', '')
    page = int(page) if page.isdigit() else 1
    start = (page-1)*PAGE_SIZE
    end = start + PAGE_SIZE
    total = len(productList)
    num_page = math.ceil(total/PAGE_SIZE)

    categoryList = Category.objects.all()
    valueList = Value.objects.all()
    context = {
        'priceList': priceList,
        'categoryList': categoryList,
        'valueList': valueList,
        'productList': productList[start:end],
        'title': title,
        'categoryId': categoryId or '',
        'valueId': valueId or '',
        'priceId': priceId or '',
        'page': page, 'start': start, 'end': end, 'total': total,
        'num_page': num_page
    }

    return render(request, 'customer/allproducts.html', context)


def AllHeroesView(request):
    title = request.GET.get('title', '')
    heroList = Hero.objects.filter(title__icontains=title)

    categoryheroId = request.GET.get('categoryheroId')    
    categoryheroId = int(categoryheroId) if categoryheroId else None
    if categoryheroId:
        heroList = heroList.filter(categoryhero__id=categoryheroId)

    page = request.GET.get('page', '')
    page = int(page) if page.isdigit() else 1
    start = (page-1)*PAGE_SIZE
    end = start + PAGE_SIZE
    total = len(heroList)
    num_page = math.ceil(total/PAGE_SIZE)

    categoryheroList = CategoryHero.objects.all()

    context = {
        'categoryheroList': categoryheroList,
        'heroList': heroList[start:end],
        'title': title,
        'categoryheroId': categoryheroId or '',
        'page': page, 'start': start, 'end': end, 'total': total,
        'num_page': num_page
    }

    return render(request, 'customer/allheroes.html', context)


def AllItemsView(request):
    title = request.GET.get('title', '')
    itemList = Item.objects.filter(title__icontains=title)

    categoryitemId = request.GET.get('categoryitemId')    
    categoryitemId = int(categoryitemId) if categoryitemId else None
    if categoryitemId:
        itemList = itemList.filter(categoryitem__id=categoryitemId)

    categoryitemList = CategoryItem.objects.all()

    context = {
        'categoryitemList': categoryitemList,
        'itemList': itemList,
        'title': title,
        'categoryitemId': categoryitemId or ''
    }

    return render(request, 'customer/allitems.html', context)


PAGE_SIZENEWS = 4


def AllNewsView(request):
    title = request.GET.get('title', '')
    newList = New.objects.filter(title__icontains=title)

    categorynewId = request.GET.get('categorynewId')    
    categorynewId = int(categorynewId) if categorynewId else None
    if categorynewId:
        newList = newList.filter(categorynew__id=categorynewId)

    page = request.GET.get('page', '')
    page = int(page) if page.isdigit() else 1
    start = (page-1)*PAGE_SIZENEWS
    end = start + PAGE_SIZENEWS
    total = len(newList)
    num_page = math.ceil(total/PAGE_SIZENEWS)

    categorynewList = CategoryNew.objects.all()

    context = {
        'categorynewList': categorynewList,
        'newList': newList[start:end],
        'title': title,
        'categorynewId': categorynewId or '',
        'page': page, 'start': start, 'end': end, 'total': total,
        'num_page': num_page
    }

    return render(request, 'customer/allnews.html', context)


class ProductDetailView(EcomMixin, TemplateView):
    template_name = "customer/productdetail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        url_slug = self.kwargs['slug']
        product = Product.objects.get(slug=url_slug)
        product.view_count += 1
        product.save()
        context['product'] = product
        return context


class HeroDetailView(EcomMixin, TemplateView):
    template_name = "customer/herodetail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        url_slug = self.kwargs['slug']
        hero = Hero.objects.get(slug=url_slug)
        hero.view_count += 1
        hero.save()
        context['hero'] = hero
        return context


class ItemDetailView(EcomMixin, TemplateView):
    template_name = "customer/itemdetail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        url_slug = self.kwargs['slug']
        item = Item.objects.get(slug=url_slug)
        item.view_count += 1
        item.save()
        context['item'] = item
        return context


class NewsDetailView(EcomMixin, TemplateView):
    template_name = "customer/newsdetail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        url_slug = self.kwargs['slug']
        news = New.objects.get(slug=url_slug)
        news.view_count += 1
        news.save()
        context['news'] = news
        return context


class AddToCartView(EcomMixin, TemplateView):
    template_name = "customer/addtocart.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # get product id from requested url
        product_id = self.kwargs['pro_id']
        # get product
        product_obj = Product.objects.get(id=product_id)

        # check if cart exists
        cart_id = self.request.session.get("cart_id", None)
        if cart_id:
            cart_obj = Cart.objects.get(id=cart_id)
            this_product_in_cart = cart_obj.cartproduct_set.filter(
                product=product_obj)

            # item already exists in cart
            if this_product_in_cart.exists():
                cartproduct = this_product_in_cart.last()
                cartproduct.quantity += 1
                cartproduct.subtotal += product_obj.selling_price
                cartproduct.save()
                cart_obj.total += product_obj.selling_price
                cart_obj.save()
            # new item is added in cart
            else:
                cartproduct = CartProduct.objects.create(
                    cart=cart_obj, product=product_obj, rate=product_obj.selling_price, quantity=1, subtotal=product_obj.selling_price)
                cart_obj.total += product_obj.selling_price
                cart_obj.save()

        else:
            cart_obj = Cart.objects.create(total=0)
            self.request.session['cart_id'] = cart_obj.id
            cartproduct = CartProduct.objects.create(
                cart=cart_obj, product=product_obj, rate=product_obj.selling_price, quantity=1, subtotal=product_obj.selling_price)
            cart_obj.total += product_obj.selling_price
            cart_obj.save()

        return context


class ManageCartView(EcomMixin, View):
    def get(self, request, *args, **kwargs):
        cp_id = self.kwargs["cp_id"]
        action = request.GET.get("action")
        cp_obj = CartProduct.objects.get(id=cp_id)
        cart_obj = cp_obj.cart

        if action == "inc":
            cp_obj.quantity += 1
            cp_obj.subtotal += cp_obj.rate
            cp_obj.save()
            cart_obj.total += cp_obj.rate
            cart_obj.save()
        elif action == "dcr":
            cp_obj.quantity -= 1
            cp_obj.subtotal -= cp_obj.rate
            cp_obj.save()
            cart_obj.total -= cp_obj.rate
            cart_obj.save()
            if cp_obj.quantity == 0:
                cp_obj.delete()

        elif action == "rmv":
            cart_obj.total -= cp_obj.subtotal
            cart_obj.save()
            cp_obj.delete()
        else:
            pass
        return redirect("app:mycart")


class EmptyCartView(EcomMixin, View):
    def get(self, request, *args, **kwargs):
        cart_id = request.session.get("cart_id", None)
        if cart_id:
            cart = Cart.objects.get(id=cart_id)
            cart.cartproduct_set.all().delete()
            cart.total = 0
            cart.save()
        return redirect("app:mycart")


class MyCartView(EcomMixin, TemplateView):
    template_name = "customer/mycart.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        cart_id = self.request.session.get("cart_id", None)
        if cart_id:
            cart = Cart.objects.get(id=cart_id)
        else:
            cart = None
        context['cart'] = cart
        return context


class CheckoutView(EcomMixin, CreateView):
    template_name = "customer/checkout.html"
    form_class = CheckoutForm
    success_url = reverse_lazy("app:home")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and request.user.customer:
            pass
        else:
            return redirect("/login/?next=/checkout/")
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        cart_id = self.request.session.get("cart_id", None)
        if cart_id:
            cart_obj = Cart.objects.get(id=cart_id)
        else:
            cart_obj = None
        context['cart'] = cart_obj
        return context

    def form_valid(self, form):
        cart_id = self.request.session.get("cart_id")
        if cart_id:
            cart_obj = Cart.objects.get(id=cart_id)
            form.instance.cart = cart_obj
            form.instance.subtotal = cart_obj.total
            form.instance.discount = 0
            form.instance.total = cart_obj.total
            form.instance.order_status = "Đang xử lí"
        else:
            return redirect("app:home")
        return super().form_valid(form)


class CustomerRegistrationView(CreateView):
    template_name = "customer/customerregistration.html"
    form_class = CustomerRegistrationForm
    success_url = reverse_lazy("app:home")

    def form_valid(self, form):
        username = form.cleaned_data.get("username")
        password = form.cleaned_data.get("password")
        email = form.cleaned_data.get("email")
        user = User.objects.create_user(username, email, password)
        form.instance.user = user
        login(self.request, user)
        return super().form_valid(form)

    def get_success_url(self):
        if "next" in self.request.GET:
            next_url = self.request.GET.get("next")
            return next_url
        else:
            return self.success_url


class CustomerLoginView(FormView):
    template_name = "customer/customerlogin.html"
    form_class = CustomerLoginForm
    success_url = reverse_lazy("app:home")

    def form_valid(self, form):
        uname = form.cleaned_data.get("username")
        pword = form.cleaned_data["password"]
        usr = authenticate(username=uname, password=pword)
        if usr is not None and Customer.objects.filter(user=usr).exists():
            login(self.request, usr)
        else:
            return render(self.request, self.template_name, {"form": self.form_class, "error": "Invalid credentials"})

        return super().form_valid(form)

    def get_success_url(self):
        if "next" in self.request.GET:
            next_url = self.request.GET.get("next")
            return next_url
        else:
            return self.success_url


class CustomerLogoutView(View):
    def get(self, request):
        logout(request)
        return redirect("app:home")


class CustomerProfileView(TemplateView):
    template_name = "customer/customerprofile.html"

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and Customer.objects.filter(user=request.user).exists():
            pass
        else:
            return redirect("/login/?next=/profile/")
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        customer = self.request.user.customer
        context['customer'] = customer
        orders = Order.objects.filter(cart__customer=customer).order_by("-id")
        context["orders"] = orders
        return context


class CustomerOrderDetailView(DetailView):
    template_name = "customer/customerorderdetail.html"
    model = Order
    context_object_name = "ord_obj"

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and Customer.objects.filter(user=request.user).exists():
            order_id = self.kwargs["pk"]
            order = Order.objects.get(id=order_id)
            if request.user.customer != order.cart.customer:
                return redirect("app:customerprofile")
        else:
            return redirect("/login/?next=/profile/")
        return super().dispatch(request, *args, **kwargs)


class PasswordForgotView(FormView):
    template_name = "customer/forgotpassword.html"
    form_class = PasswordForgotForm
    success_url = "/forgot-password/?m=s"

    def form_valid(self, form):
        # get email from user
        email = form.cleaned_data.get("email")
        # get current host ip/domain
        url = self.request.META['HTTP_HOST']
        # get customer and then user
        customer = Customer.objects.get(user__email=email)
        user = customer.user
        # send mail to the user with email
        text_content = 'Vui lòng nhấn vào liên kết dưới đây để đặt lại mật khẩu của bạn. '
        html_content = url + "/password-reset/" + email + "/" + password_reset_token.make_token(user) + "/"
        send_mail(
            'Liên kết đặt lại mật khẩu | Amin',
            text_content + html_content,
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,
        )

        return super().form_valid(form)


class PasswordResetView(FormView):
    template_name = "customer/passwordreset.html"
    form_class = PasswordResetForm
    success_url = "/login/"

    def dispatch(self, request, *args, **kwargs):
        email = self.kwargs.get("email")
        user = User.objects.get(email=email)
        token = self.kwargs.get("token")
        if user is not None and password_reset_token.check_token(user, token):
            pass
        else:
            return redirect(reverse("app:passworforgot") + "?m=e")

        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        password = form.cleaned_data['new_password']
        email = self.kwargs.get("email")
        user = User.objects.get(email=email)
        user.set_password(password)
        user.save()
        return super().form_valid(form)


# staff


class StaffLoginView(FormView):
    template_name = "staff/stafflogin.html"
    form_class = CustomerLoginForm
    success_url = reverse_lazy("app:stafforderlist")

    def form_valid(self, form):
        uname = form.cleaned_data.get("username")
        pword = form.cleaned_data["password"]
        usr = authenticate(username=uname, password=pword)
        if usr is not None and Staff.objects.filter(user=usr).exists():
            login(self.request, usr)
        else:
            return render(self.request, self.template_name, {"form": self.form_class, "error": "Thông tin không hợp lệ!"})
        return super().form_valid(form)


class StaffLogoutView(View):
    def get(self, request):
        logout(request)
        return redirect("app:stafflogin")


class StaffRequiredMixin(object):
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated and Staff.objects.filter(user=request.user).exists():
            pass
        else:
            return redirect("/staff-login/")
        return super().dispatch(request, *args, **kwargs)


class StaffOrderListView(StaffRequiredMixin, ListView):
    template_name = "staff/orders/stafforderlist.html"
    queryset = Order.objects.all().order_by("-id")
    context_object_name = "allorders"


class StaffOrderDetailView(StaffRequiredMixin, DetailView):
    template_name = "staff/orders/stafforderdetail.html"
    model = Order
    context_object_name = "ord_obj"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["allstatus"] = ORDER_STATUS
        return context


class StaffOrderStatuChangeView(StaffRequiredMixin, View):
    def post(self, request, *args, **kwargs):
        order_id = self.kwargs["pk"]
        order_obj = Order.objects.get(id=order_id)
        new_status = request.POST.get("status")
        order_obj.order_status = new_status
        order_obj.save()
        return redirect(reverse_lazy("app:stafforderdetail", kwargs={"pk": order_id}))


class StaffCategoryHeroListView(StaffRequiredMixin, ListView):
    template_name = "staff/heroes/category/staffcategoryherolist.html"
    queryset = CategoryHero.objects.all().order_by("-id")
    context_object_name = "allcategoryhero"


@method_decorator(login_required, name='dispatch')
class StaffCategoryHeroCreateView(CreateView):
    model = CategoryHero
    fields = '__all__'
    success_url = '/staff-all-categoryhero'
    template_name = 'staff/heroes/category/staffcategoryherocreate.html'


@method_decorator(login_required, name='dispatch')
class StaffCategoryHeroUpdateView(UpdateView):
    model = CategoryHero
    fields = '__all__'
    success_url = '/staff-all-categoryhero'
    template_name = 'staff/heroes/category/staffcategoryheroupdate.html'


@login_required
def StaffCategoryHeroDeleteView(request, pk):

    p = CategoryHero.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-categoryhero')


class StaffHeroListView(StaffRequiredMixin, ListView):
    template_name = "staff/heroes/hero/staffherolist.html"
    queryset = Hero.objects.all().order_by("-id")
    context_object_name = "allhero"


@method_decorator(login_required, name='dispatch')
class StaffHeroCreateView(CreateView):
    model = Hero
    fields = '__all__'
    success_url = '/staff-all-hero'
    template_name = 'staff/heroes/hero/staffherocreate.html'


@method_decorator(login_required, name='dispatch')
class StaffHeroUpdateView(UpdateView):
    model = Hero
    fields = '__all__'
    success_url = '/staff-all-hero'
    template_name = 'staff/heroes/hero/staffheroupdate.html'


@login_required
def StaffHeroDeleteView(request, pk):

    p = Hero.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-hero')


class StaffStatListView(StaffRequiredMixin, ListView):
    template_name = "staff/heroes/stat/staffstatlist.html"
    queryset = Stat.objects.all().order_by("-id")
    context_object_name = "allstat"


@method_decorator(login_required, name='dispatch')
class StaffStatCreateView(CreateView):
    model = Stat
    fields = '__all__'
    success_url = '/staff-all-stat'
    template_name = 'staff/heroes/stat/staffstatcreate.html'


@method_decorator(login_required, name='dispatch')
class StaffStatUpdateView(UpdateView):
    model = Stat
    fields = '__all__'
    success_url = '/staff-all-stat'
    template_name = 'staff/heroes/stat/staffstatupdate.html'


@login_required
def StaffStatDeleteView(request, pk):

    p = Stat.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-stat')


class StaffSkillListView(StaffRequiredMixin, ListView):
    template_name = "staff/heroes/skill/staffskilllist.html"
    queryset = Skill.objects.all().order_by("-id")
    context_object_name = "allskill"


@method_decorator(login_required, name='dispatch')
class StaffSkillCreateView(CreateView):
    model = Skill
    fields = '__all__'
    success_url = '/staff-all-skill'
    template_name = 'staff/heroes/skill/staffskillcreate.html'


@method_decorator(login_required, name='dispatch')
class StaffSkillUpdateView(UpdateView):
    model = Skill
    fields = '__all__'
    success_url = '/staff-all-skill'
    template_name = 'staff/heroes/skill/staffskillupdate.html'


@login_required
def StaffSkillDeleteView(request, pk):

    p = Skill.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-skill')


class StaffItemListView(StaffRequiredMixin, ListView):
    template_name = "staff/items/item/staffitemlist.html"
    queryset = Item.objects.all().order_by("-id")
    context_object_name = "allitem"


@method_decorator(login_required, name='dispatch')
class StaffItemCreateView(CreateView):
    model = Item
    fields = '__all__'
    success_url = '/staff-all-item'
    template_name = 'staff/items/item/staffitemcreate.html'


@method_decorator(login_required, name='dispatch')
class StaffItemUpdateView(UpdateView):
    model = Item
    fields = '__all__'
    success_url = '/staff-all-item'
    template_name = 'staff/items/item/staffitemupdate.html'


@login_required
def StaffItemDeleteView(request, pk):

    p = Item.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-item')


class StaffCategoryItemListView(StaffRequiredMixin, ListView):
    template_name = "staff/items/category/staffcategoryitemlist.html"
    queryset = CategoryItem.objects.all().order_by("-id")
    context_object_name = "allcategoryitem"


@method_decorator(login_required, name='dispatch')
class StaffCategoryItemCreateView(CreateView):
    model = CategoryItem
    fields = '__all__'
    success_url = '/staff-all-categoryitem'
    template_name = 'staff/items/category/staffcategoryitemcreate.html'


@method_decorator(login_required, name='dispatch')
class StaffCategoryItemUpdateView(UpdateView):
    model = CategoryItem
    fields = '__all__'
    success_url = '/staff-all-categoryitem'
    template_name = 'staff/items/category/staffcategoryitemupdate.html'


@login_required
def StaffCategoryItemDeleteView(request, pk):

    p = CategoryItem.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-categoryitem')


class StaffProductListView(StaffRequiredMixin, ListView):
    template_name = "staff/products/product/staffproductlist.html"
    queryset = Product.objects.all().order_by("-id")
    context_object_name = "allproduct"


@method_decorator(login_required, name='dispatch')
class StaffProductCreateView(CreateView):
    model = Product
    fields = '__all__'
    success_url = '/staff-all-product'
    template_name = 'staff/products/product/staffproductcreate.html'


@method_decorator(login_required, name='dispatch')
class StaffProductUpdateView(UpdateView):
    model = Product
    fields = '__all__'
    success_url = '/staff-all-product'
    template_name = 'staff/products/product/staffproductupdate.html'


@login_required
def StaffProductDeleteView(request, pk):

    p = Product.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-product')


class StaffCategoryListView(StaffRequiredMixin, ListView):
    template_name = "staff/products/category/staffcategorylist.html"
    queryset = Category.objects.all().order_by("-id")
    context_object_name = "allcategory"


@method_decorator(login_required, name='dispatch')
class StaffCategoryCreateView(CreateView):
    model = Category
    fields = '__all__'
    success_url = '/staff-all-category'
    template_name = 'staff/products/category/staffcategorycreate.html'


@method_decorator(login_required, name='dispatch')
class StaffCategoryUpdateView(UpdateView):
    model = Category
    fields = '__all__'
    success_url = '/staff-all-category'
    template_name = 'staff/products/category/staffcategoryupdate.html'


@login_required
def StaffCategoryDeleteView(request, pk):

    p = Category.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-category')


class StaffValueListView(StaffRequiredMixin, ListView):
    template_name = "staff/products/value/staffvaluelist.html"
    queryset = Value.objects.all().order_by("-id")
    context_object_name = "allvalue"


@method_decorator(login_required, name='dispatch')
class StaffValueCreateView(CreateView):
    model = Value
    fields = '__all__'
    success_url = '/staff-all-value'
    template_name = 'staff/products/value/staffvaluecreate.html'


@method_decorator(login_required, name='dispatch')
class StaffValueUpdateView(UpdateView):
    model = Value
    fields = '__all__'
    success_url = '/staff-all-value'
    template_name = 'staff/products/value/staffvalueupdate.html'


@login_required
def StaffValueDeleteView(request, pk):

    p = Value.objects.get(pk=pk)
    p.delete()
    return redirect('/staff-all-value')


