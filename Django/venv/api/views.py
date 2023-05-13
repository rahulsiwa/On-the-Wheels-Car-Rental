from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from django.contrib.auth import authenticate, login, logout
from rest_framework_simplejwt.tokens import RefreshToken
from api.serializers import *
from app.models import *
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.hashers import check_password
from django.db.models import Q
import random
from django.core.mail import send_mail
# Create your views here.

@api_view(['POST'])
def loginuser(request):
    data = request.data

    try:
        get_user = CustomUser.objects.filter(email=data['email'])
        if get_user is not None:
            check_pass = check_password(data['password'], get_user[0].password)
        if not check_pass:
            return Response({'status': 401, 'message': 'Wrong password'})
        email = CustomUser.objects.get(email=data['email'])
        if email is not None:
            serializer = AuthSerializer(email, many=False)
            user = authenticate(request, email=email,
                                password=data['password'])
            if user is not None:
                login(request, user)
                refresh = RefreshToken.for_user(user)
                return Response({'status': 200, 'user': serializer.data, 'refresh': str(refresh), 'access_token': str(refresh.access_token), 'message': 'Login successfull'})

    except:
        return Response({'status': 404, 'message': 'No such user found'})


@api_view(['POST'])
def register(request):
    data = request.data
    if not data['email'] or not data['password'] or not data['name']:
        return Response({'status': 400, 'message': 'Fields cannot be empty.'})

    if CustomUser.objects.filter(email=data['email']).exists():
        return Response({'status': 401, 'message': 'Email already taken'})

    user_obj = CustomUser.objects.create_user(
        email=data['email'],
        name=data['name'],
    )
    user_obj.set_password(data['password'])
    user_obj.is_active = True
    user_obj.is_superuser = False
    user_obj.save()
    return Response({'status': 200, 'message': 'User registered successfully'})


# profile
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def updateProfile(request, id):
    try:
        value = CustomUser.objects.get(id=id)
        if bool(request.data.get('image', False)) != False:
            value.image = request.FILES['image']
        serializer = AuthSerializer(value, data=request.POST, partial=True)
        if serializer.is_valid(raise_exception=True):
            serializer.save()

        else:
            return Response({'status': 400, 'message': 'Cannot update profile'})
        return Response({'status': 200, 'message': 'Profile updated successfully'})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def updatePassword(request, id):
    user = CustomUser.objects.exists(id = id).exists()
    if not user:
        return Response({'status':400, 'message':'No such user'})
    finalUser = CustomUser.objects.get(id = id)
    finalUser.set_password(request['password'])
    finalUser.save()
    return Response({'status':200, 'message':'Updated successfully'})

# profile
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getUserProfile(request, id):
    try:
        user = CustomUser.objects.get(id = id)
        serializer = AuthSerializer(user, many=False)
        return Response({'status':200, 'user':serializer.data})
    
    except Exception as e:
        return Response({'status':200, 'error':str(e)})

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getSingleUser(request, id):
    user = CustomUser.objects.get(id = id)
    serializer = AuthSerializer(user, many = False)
    return Response({'status':200, 'user':serializer.data})


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def logoutuser(request):
    logout(request)
    return Response({'status':200})

# categories
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def categories(request):
    try:
        data = Category.objects.all()
        serializer = CategorySerializer(data, many=True)
        return Response({'status': 200, 'categories': serializer.data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})

@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def cars(request):
    try:
        data = Car.objects.all()
        serializer = CarSerializer(data, many=True)
        return Response({'status': 200, 'cars': serializer.data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def carsAccordingToCategory(request, id):
    try:
        data = Car.objects.filter(category = id)
        serializer = CarSerializer(data, many=True)
        return Response({'status': 200, 'cars': serializer.data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})

#kyc
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def addKYC(request):
    data = request.data
    if not data['user_id'] or not data['licenseImage'] or not data['identityImage']:
        return Response({'status': 400, 'message': 'Fields cannot be empty'})
    user = CustomUser.objects.get(id=data['user_id'])
    try:
        kyc = KYC.objects.create(
            licenseImage=data['licenseImage'],
            identityImage=data['identityImage'],
            user_id=user,
        )
        KYCSerializer(kyc, many=False)
        return Response({'status': 200, 'message': 'Kyc added successfully'})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getUserKYC(request, id):
    try:
        data = KYC.objects.get(user_id=id)
        serializer = KYCSerializer(data, many=False)
        return Response({'status': 200, 'KYC': serializer.data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def banners(request):
    try:
        data = Banner.objects.all()
        serializer = BannerSerializer(data, many=True)
        return Response({'status': 200, 'banners': serializer.data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
# Whishlist
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def addToWhishList(request):
    try:
        data = request.data
        productAlreadyAddedToWhish = Wishlist.objects.filter(Q(user_id = request.data['user_id']) & Q(car_id = request.data['car_id'])).exists()
        if productAlreadyAddedToWhish:
            return Response({'status': 405, 'message':'Car already added to whishlist.'})
        product = Car.objects.get(id=data['car_id'])
        user = CustomUser.objects.get(id=data['user_id'])
        value = Wishlist.objects.create(
            car_id = product,
            user_id = user
        )
        value.save()
        return Response({'status': 200, 'message': 'Added'})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getWhishlistAccordingToUser(request, id):
    try:
        cart_items = Wishlist.objects.filter(user_id=id)
        serializer = WishlistSerializer(cart_items, many=True)
        data = serializer.data
        return Response({'status': 200, 'whishlists': data})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def deleteWhishItem(request, id):
    try:
        value = Wishlist.objects.get(id = id)
        value.delete()
        return Response({'status': 200, 'message': 'Successfully deleted'})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
# booking
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def addBooking(request):
    try:
        data = request.data
        product = Car.objects.get(id=data['car'])
        user = CustomUser.objects.get(id=data['user'])
        value = Booking.objects.create(
            car = product,
            user = user,
            pick_date = data['pick_date'],
            return_date = data['return_date'],
            pick_location = data['pick_location'],
            drop_location = data['drop_location']
        )
        value.save()
        return Response({'status': 200, 'message': 'Added'})

    except Exception as e:
        return Response({'status': 500, "message": str(e)})
    
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def getMyBookings(request):
    try:    
        booking = Booking.objects.filter(user = request.data['user'])
        serializer = BookingSerializer(booking, many = True)
        data = serializer.data
        return Response({'status':200, 'bookings':data})
    
    except Exception as e:
        return Response({'status':500, 'message':str(e)})
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def checkEmail(request):
    try:
        email = OTP.objects.filter(email = request.data['email']).exists()
        if not email:
            return Response({'status':500, 'message':'No such user'})
        user = CustomUser.objects.get(email=request.data['email']).id
        checkOtp = OTP.objects.filter(user = user).exists()
        random_float =  random.randint(1000, 9999)
        if checkOtp:
            otp = OTP.objects.get(user = user)
            otp.otp = random_float
            otp.save()
            subject = 'Car rental verification code'
            message = 'Your verification code is:' + str(random_float)
            from_email = 'rahulsiwa8@gmail.com'
            recipient_list = [request.data['email']]
            send_mail(subject, message, from_email, recipient_list)
            return Response({'status':200})

        else:
            otp = OTP.objects.create(
                user = CustomUser.objects.get(id = user),
                otp = random_float
            )
            otp.save()
            subject = 'Car rental verification code'
            message = 'Your verification code is:' + str(random_float)
            from_email = 'rahulsiwa8@gmail.com'
            recipient_list = [request.data['email']]
            send_mail(subject, message, from_email, recipient_list)
            return Response({'status':200})
        
    except Exception as e:
        return Response({'status':500, 'message':str(e)})
    
@api_view(['POST'])
def updatePassword(request):
    try:
        user = CustomUser.objects.get(email = request.data['email'])
        user.set_password(request.data['password'])
        user.save()
        return Response({'status': 200})
    
    except Exception as e:
        return Response({'status':500, 'message':str(e)})

@api_view(['POST'])
def checkOtp(request):
    user = CustomUser.objects.get(email = request.data['email']).id
    print(user)
    otp = OTP.objects.get(user = user).otp
    print(type(otp))
    if str(otp) == request.data['otp']:
        return Response({'status': 200})
    else:
        return Response({'status':500})


        

