from django.urls import path, include
from .views import *

app_name = 'app'

urlpatterns = [

    # customer
    path('', HomeView.as_view(), name='home'),
    path('tutorial/', TutorialView.as_view(), name='tutorial'),
    
    # heroes
    path('all-heroes/', AllHeroesView, name='allheroes'),
    path('hero/<slug:slug>/', HeroDetailView.as_view(), name='herodetail'),

    # items
    path('all-items/', AllItemsView, name='allitems'),
    path('item/<slug:slug>/', ItemDetailView.as_view(), name='itemdetail'),

    # products
    path('all-products/', AllProductsView, name='allproducts'),
    path('product/<slug:slug>/', ProductDetailView.as_view(), name='productdetail'),

    # carts
    path('add-to-cart-<int:pro_id>/', AddToCartView.as_view(), name='addtocart'),
    path('my-cart/', MyCartView.as_view(), name='mycart'),
    path('manage-cart/<int:cp_id>/', ManageCartView.as_view(), name='managecart'),
    path('empty-cart/', EmptyCartView.as_view(), name='emptycart'),
    path('checkout/', CheckoutView.as_view(), name='checkout'),

    # login - register
    path('register/', CustomerRegistrationView.as_view(), name='customerregistration'),
    path('login/', CustomerLoginView.as_view(), name='customerlogin'),
    path('logout/', CustomerLogoutView.as_view(), name='customerlogout'),
    path('profile/', CustomerProfileView.as_view(), name='customerprofile'),
    path('profile/order-<int:pk>/', CustomerOrderDetailView.as_view(), name='customerorderdetail'),
    path('forgot-password/', PasswordForgotView.as_view(), name='passwordforgot'),
    path('password-reset/<email>/<token>/', PasswordResetView.as_view(), name='passwordreset'),

    # news
    path('all-news/', AllNewsView, name='allnews'),
    path('news/<slug:slug>/', NewsDetailView.as_view(), name='newsdetail'),

    #--------------------------------------------------------------------#

    # staff
    path('staff-login/', StaffLoginView.as_view(), name='stafflogin'),
    path('staff-logout/', StaffLogoutView.as_view(), name='stafflogout'),

    # orders
    path('staff-all-orders/', StaffOrderListView.as_view(), name='stafforderlist'),
    path('staff-order/<int:pk>/', StaffOrderDetailView.as_view(), name='stafforderdetail'),
    path('staff-order-<int:pk>-change/', StaffOrderStatuChangeView.as_view(), name='stafforderstatuschange'),

    # category-heroes
    path('staff-all-categoryhero/', StaffCategoryHeroListView.as_view(), name='staffcategoryherolist'),
    path('staff-create-categoryhero/', StaffCategoryHeroCreateView.as_view(), name='staffcreatecategoryhero'),
    path('staff-update-categoryhero/<int:pk>', StaffCategoryHeroUpdateView.as_view(), name='staffupdatecategoryhero'),
    path('staff-delete-categoryhero/<int:pk>', StaffCategoryHeroDeleteView, name='staffdeletecategoryhero'),

    # heroes
    path('staff-all-hero/', StaffHeroListView.as_view(), name='staffherolist'),
    path('staff-create-hero/', StaffHeroCreateView.as_view(), name='staffcreatehero'),
    path('staff-update-hero/<int:pk>', StaffHeroUpdateView.as_view(), name='staffupdatehero'),
    path('staff-delete-hero/<int:pk>', StaffHeroDeleteView, name='staffdeletehero'),

    # stats
    path('staff-all-stat/', StaffStatListView.as_view(), name='staffstatlist'),
    path('staff-create-stat/', StaffStatCreateView.as_view(), name='staffcreatestat'),
    path('staff-update-stat/<int:pk>', StaffStatUpdateView.as_view(), name='staffupdatestat'),
    path('staff-delete-stat/<int:pk>', StaffStatDeleteView, name='staffdeletestat'),

    # skill
    path('staff-all-skill/', StaffSkillListView.as_view(), name='staffskilllist'),
    path('staff-create-skill/', StaffSkillCreateView.as_view(), name='staffcreateskill'),
    path('staff-update-skill/<int:pk>', StaffSkillUpdateView.as_view(), name='staffupdateskill'),
    path('staff-delete-skill/<int:pk>', StaffSkillDeleteView, name='staffdeleteskill'),

    # items
    path('staff-all-item/', StaffItemListView.as_view(), name='staffitemlist'),
    path('staff-create-item/', StaffItemCreateView.as_view(), name='staffcreateitem'),
    path('staff-update-item/<int:pk>', StaffItemUpdateView.as_view(), name='staffupdateitem'),
    path('staff-delete-item/<int:pk>', StaffItemDeleteView, name='staffdeleteitem'),

    # category-item
    path('staff-all-categoryitem/', StaffCategoryItemListView.as_view(), name='staffcategoryitemlist'),
    path('staff-create-categoryitem/', StaffCategoryItemCreateView.as_view(), name='staffcreatecategoryitem'),
    path('staff-update-categoryitem/<int:pk>', StaffCategoryItemUpdateView.as_view(), name='staffupdatecategoryitem'),
    path('staff-delete-categoryitem/<int:pk>', StaffCategoryItemDeleteView, name='staffdeletecategoryitem'),

    # products
    path('staff-all-product/', StaffProductListView.as_view(), name='staffproductlist'),
    path('staff-create-product/', StaffProductCreateView.as_view(), name='staffcreateproduct'),
    path('staff-update-product/<int:pk>', StaffProductUpdateView.as_view(), name='staffupdateproduct'),
    path('staff-delete-product/<int:pk>', StaffProductDeleteView, name='staffdeleteproduct'),

    # category-product
    path('staff-all-category/', StaffCategoryListView.as_view(), name='staffcategorylist'),
    path('staff-create-category/', StaffCategoryCreateView.as_view(), name='staffcreatecategory'),
    path('staff-update-category/<int:pk>', StaffCategoryUpdateView.as_view(), name='staffupdatecategory'),
    path('staff-delete-category/<int:pk>', StaffCategoryDeleteView, name='staffdeletecategory'),

    # values
    path('staff-all-value/', StaffValueListView.as_view(), name='staffvaluelist'),
    path('staff-create-value/', StaffValueCreateView.as_view(), name='staffcreatevalue'),
    path('staff-update-value/<int:pk>', StaffValueUpdateView.as_view(), name='staffupdatevalue'),
    path('staff-delete-value/<int:pk>', StaffValueDeleteView, name='staffdeletevalue'),
]