from django.urls import path
from api.views import *


urlpatterns = [
    path('login/', loginuser),
    path('register/', register),
    path('logout/', logoutuser),
    path('addKyc/', addKYC),
    path('getUserKyc/<int:id>', getUserKYC),
    path('getUserProfile/<int:id>', getUserProfile),
    path('update-profile/<int:id>', updateProfile),
    path('uppdate-password/<int:id>', updatePassword),
    path('get-single-user/<int:id>', getSingleUser),
    # category
    path('categories/', categories),

    # cars
    path('cars/', cars),
    path('cars-according-to-category/<int:id>', carsAccordingToCategory),

    # banners
    path('banners/', banners),

    # whishlist
    path('add-to-whish/', addToWhishList),
    path('delete-wish-item/<int:id>', deleteWhishItem),
    path('get-wish-according-to-user/<int:id>', getWhishlistAccordingToUser),


    # bookings
    path('add-booking', addBooking),
    path('get-bookings', getMyBookings),

    # forgot password
    # forgot password
    path('check-email/', checkEmail),
    path('update-password/', updatePassword),
    path('check-otp/', checkOtp)
]
