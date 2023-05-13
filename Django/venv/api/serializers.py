from rest_framework import serializers
from api.models import *
from app.models import *

class AuthSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'
    
class KYCSerializer(serializers.ModelSerializer):
    class Meta:
        model = KYC
        fields = '__all__'

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class CarImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = CarImage
        fields = '__all__'

class CarSerializer(serializers.ModelSerializer):
    images = CarImageSerializer(source='carimage_set', many = True, read_only=True)
    class Meta:
        model = Car
        fields = '__all__'

class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'


class WishlistSerializer(serializers.ModelSerializer):
    car_id = serializers.SerializerMethodField()
    def get_car_id(self, obj):
        return {'id': obj.car_id.id, 'name': obj.car_id.name, 'seater': obj.car_id.seater, 'color': obj.car_id.color, 'price': obj.car_id.price, 'image': obj.car_id.main_image.url}
    
    class Meta:
        model = Wishlist
        fields = '__all__'

class BookingSerializer(serializers.ModelSerializer):
    car = serializers.SerializerMethodField()
    def get_car(self, obj):
        return {'id':obj.car.id, 'name':obj.car.name, 'main_image':obj.car.main_image.url, 'price': obj.car.price}
    class Meta:
        model = Booking
        fields = '__all__'