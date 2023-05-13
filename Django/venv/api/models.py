from django.db import models
from django.contrib.auth.models import AbstractUser
from app.models import Car
from api.manager import CustomUserManager
# Create your models here.

def upload_to(instance, filename):
    return 'images/{filename}'.format(filename=filename)

class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(unique=True)
    name =  models.CharField(max_length=16)
    image = models.ImageField(upload_to=upload_to, blank=False, null=True)
    isApproved = models.BooleanField(default=False)
    objects = CustomUserManager()
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

class KYC(models.Model):
    user_id = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    licenseImage = models.ImageField(upload_to=upload_to, blank=False, null=True)
    identityImage = models.ImageField(upload_to=upload_to, blank=False, null=True)


class Wishlist(models.Model):
    user_id = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    car_id = models.ForeignKey(Car, on_delete=models.CASCADE)

class Booking(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    pick_date = models.CharField(max_length=200)
    return_date = models.CharField(max_length=200)
    pick_location = models.CharField(max_length=200)
    drop_location = models.CharField(max_length=200)
    car = models.ForeignKey(Car, on_delete=models.CASCADE)

class OTP(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    otp = models.IntegerField()