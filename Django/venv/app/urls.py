from django.urls import path
from app import views

urlpatterns = [
    path('', views.login_view, name="login"),
    path('logout/', views.logoutUser, name="logout"),
    path('layout/', views.goToHome, name="layout"),

    # users
    path('users/', views.getAllUsers, name="users"),
    path('approve-user/<int:id>', views.approveUser, name="approve-user"),
    path('disapprove-user/<int:id>', views.disapproveUser, name="disapprove-user"),

    # category
    path('add-category/', views.addCategory, name="add-category"),
    path('categories/', views.categoryLists, name="categories"),
    path('edit-category/<int:id>', views.editCategory, name="edit-category"),
    path('update-category/<int:id>', views.updateCategory, name="update-category"),
    path('delete-category/<int:id>', views.deleteCategory, name="delete-category"),

    #car
    path('add-car/', views.addCar, name='add-car'),
    path('cars/', views.getCars, name='cars'),
    path('edit-car/<int:id>', views.editCar, name='edit-car'),
    path('update-car/<int:id>', views.updateCar, name='update-car'),
    path('delete-car/<int:id>', views.deleteCar, name='delete-car'),

    # banner
    path('add-banner/', views.addBanner, name='add-banner'),
    path('banners/', views.getBanners, name='banners'),
    path('edit-banner/<int:id>', views.editBanner, name='edit-banner'),
    path('update-banner/<int:id>', views.updateBanner, name='update-banner'),
    path('delete-banner/<int:id>', views.deleteBanner, name='delete-banner'),

]
