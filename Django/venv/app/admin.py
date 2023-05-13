from django.contrib import admin
from app.models import *
# Register your models here.

admin.site.register([Category, Car, Banner, CarImage])
