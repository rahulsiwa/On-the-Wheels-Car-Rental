from django.db import models

# Create your models here.

def upload_to(instance, filename):
    return 'images/admin/{filename}'.format(filename=filename)

# category model
class Category(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name
    
# product model
class Car(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    color = models.CharField(max_length=100, blank=False, null=True)
    seater = models.CharField(max_length=100, blank=False, null=True)
    engine = models.CharField(max_length=100, blank=False, null=True)
    main_image = models.ImageField(upload_to=upload_to, null=True)
    max_power = models.CharField(max_length=100,default=100)
    top_speed = models.CharField(max_length=100,default=100)
    motor = models.CharField(max_length=100,default=100)
    air_conditioner = models.BooleanField(default=False)
    music = models.BooleanField(default=False)
    sun_roof = models.BooleanField(default=False)
    driver = models.BooleanField(default=False)
    price = models.IntegerField() 
    description = models.TextField() 

    def __str__(self):
        return self.name
    
class CarImage(models.Model):
    car = models.ForeignKey(Car, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=upload_to)
    
class Banner(models.Model):
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to=upload_to, blank=False, null=True)

    def __str__(self):
        return self.title
