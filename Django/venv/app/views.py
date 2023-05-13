from django.shortcuts import render, redirect
from app.models import *
from api.models import *
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import check_password
import ast
# Create your views here.

def login_view(request):
    if request.method == 'POST':

        message = {}

        email = request.POST.get('email')
        password = request.POST.get('password')

        if not email:
         message['message'] = 'Email required'
         return render(request, 'auth/login.html/', message)

        if not password:
         message['message'] = 'Enter password'
         return render(request, 'auth/login.html/', message)


        check_user = CustomUser.objects.filter(email = email).exists()

        if check_user:
            get_user = CustomUser.objects.filter(email = email)
            check_pass = check_password(password, get_user[0].password)
            if not check_pass:
                message['message'] = "Wrong password"
                return render(request, 'auth/login.html/', message)

        else:
            message['message'] = 'No such user'
            return render(request, 'auth/login.html/', message)


        if not message:
            user = authenticate(email=email, password=password)
            if  user:
                login(request, user)
                return redirect('layout/')
        
        else: 
            return render(request, 'auth/login.html', message)
        
    else:
        return render(request, 'auth/login.html/')
    
def getAllUsers(request):
   users = CustomUser.objects.all()
   user_details = []
   for user in users:
      try:
          if user.is_superuser == False:
            kyc = KYC.objects.get(user_id=user.id)
            user_details.append((user, kyc))
      except KYC.DoesNotExist:
          kyc = None
          user_details.append((user, kyc))
   return render(request, 'dashboard/Users/users.html', {'users': user_details})

def approveUser(request, id):
    user = CustomUser.objects.get(id = id)
    user.isApproved = True
    user.save()
    return redirect('/users/')

def disapproveUser(request, id):
    user = CustomUser.objects.get(id = id)
    user.isApproved = False
    user.save()
    return redirect('/users/')



def logoutUser(request):
     logout(request)
     return redirect('/')

def goToHome(request):
    if not request.user.is_authenticated or not request.user.is_superuser:
     return redirect('/')
    else:
        return render(request, 'dashboard/layout/layout.html')

def addCategory(request):
    if not request.user.is_authenticated:
     return redirect('/')
    if request.method == "POST":
        name = request.POST.get('name')
        error = {'error': 'Category is required'}
        if not name:
            return render(request, 'dashboard/category/add_category.html/', error)
        category = Category.objects.create(
         name= name
        )
        category.save()
        return render(request, 'dashboard/category/add_category.html/', {'success':f'{name} added successfully'})
    else:
        return render(request, 'dashboard/category/add_category.html/')

def categoryLists(request):
    if not request.user.is_authenticated:
     return redirect('/')
    categories = Category.objects.all()
    return render(request, 'dashboard/category/list_category.html', {'categories':categories, 'index':0})

def editCategory(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    category = Category.objects.get(id=id)
    return render(request, 'dashboard/category/edit_category.html', {'category': category})

def updateCategory(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    if request.method == "POST":
        name = request.POST.get('name')
        error = {'error': 'Category is required'}
        if not name:
            return render(request, 'dashboard/category/edit_category.html/', error)
        category = Category.objects.get(id = id)
        category.name = name
        category.save()
        return redirect('/categories/')

    else:
        return render(request, 'dashboard/category/edit_category.html')

def deleteCategory(request, id):
    if not request.user.is_authenticated:
     return redirect('/')

    if request.method == 'GET':
        category = Category.objects.get(id = id)
        category.delete()
        return redirect('/categories')
    
def addCar(request):
    if not request.user.is_authenticated:
     return redirect('/')
 
    if request.method == 'GET':
       categories = Category.objects.all()
       return render(request, 'dashboard/Car/add_car.html', {'categories': categories})
    
    else:
       name = request.POST.get('name')
       price = request.POST.get('price')
       category = request.POST.get('category')
       color = request.POST.get('color')
       description = request.POST.get('description')
       seater = request.POST.get('seater')
       main_image = request.FILES.get('main_image')
       air_conditioner = request.POST.get('air_conditioner')
       if air_conditioner == None:
          air_conditioner = False
       sun_roof = request.POST.get('sun_roof')
       if sun_roof == None:
          sun_roof = False
       music = request.POST.get('music')
       if music == None:
          music = False
       driver = request.POST.get('driver')
       if driver == None:
          driver = False
       engine = request.POST.get('engine')
       max_power = request.POST.get('max_power')
       top_speed = request.POST.get('top_speed')
       if not name or not price or not category or not color or not description or not seater or not main_image or not engine or not max_power or not top_speed:
          return render(request, 'dashboard/Car/add_car.html/', {'error':'All fields are required'})
       cat = Category.objects.get(id = category)
       car = Car.objects.create(
          name = name,
          price = price,
          category = cat,
          color = color,
          description = description,
          seater = seater,
          main_image = main_image,
          air_conditioner=air_conditioner,
          engine=engine,
          max_power = max_power,
          music = music,
          sun_roof = sun_roof,
          top_speed = top_speed
       )

       car.save()

       images =  request.FILES.getlist('images')
       for img in images:
          image = CarImage.objects.create(car = car, image = img)
          image.save()

       return render(request, 'dashboard/Car/add_car.html/', {'success': 'Car added successfully'})
    
def getCars(request):
   if not request.user.is_authenticated:
     return redirect('/')
   all_cars = []
   cars = Car.objects.all()
   for car in cars:
      images = CarImage.objects.filter(car = car)
      all_cars.append((car, images))
   return render(request, 'dashboard/Car/car_list.html', {'cars':all_cars})

def editCar(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    car = Car.objects.get(id=id)
    categories = Category.objects.all()
    return render(request, 'dashboard/Car/edit_car.html', {'categories': categories, 'car': car,})

def updateCar(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    print(request.POST.get('air_conditioner'))
    print(request.POST.get('sun_roof'))
    name = request.POST.get('name')
    price = request.POST.get('price')
    category = request.POST.get('category')
    color = request.POST.get('color')
    description = request.POST.get('description')
    seater = request.POST.get('seater')
    air_conditioner = request.POST.get('air_conditioner')
    if air_conditioner == None:
        air_conditioner = False
    sun_roof = request.POST.get('sun_roof')
    if sun_roof == None:
        sun_roof = False
    music = request.POST.get('music')
    if music == None:
        music = False
    driver = request.POST.get('driver')
    if driver == None:
        driver = False
    engine = request.POST.get('engine')
    max_power = request.POST.get('max_power')
    top_speed = request.POST.get('top_speed')
    if not name or not price or not category or not color or not description or not seater or not max_power or not top_speed or not engine:
        return render(request, 'dashboard/car/edit_car.html/', {'error': 'Fields cannot be empty'})
    car = Car.objects.get(id = id)
    mainCategory = Category.objects.get(id = category)
    car.name = name
    car.price = price
    car.category = mainCategory
    car.color = color
    car.description = description
    car.seater = seater
    air_conditioner = air_conditioner
    car.engine=engine
    car.max_power = max_power
    car.music = music
    car.sun_roof = sun_roof
    car.top_speed = top_speed
    car.driver = driver
    if 'main_image' in request.FILES:
        car.main_image = request.FILES['main_image']
    if 'images' in request.FILES.getlist('images'):
        carImg = CarImage.objects.filter(car = car)
        for img in carImg:
           img.delete()
        for image in request.FILES.getlist('images'):
           carImage = CarImage.objects.create(car = car, image = image)
           carImage.save()
    car.save()
    return redirect('/cars/')

def deleteCar(request, id):
    if not request.user.is_authenticated:
     return redirect('/')

    if request.method == 'GET':
        category = Car.objects.get(id = id)
        category.delete()
        return redirect('/cars')
    
# banner
def addBanner(request):
    if not request.user.is_authenticated:
     return redirect('/')
 
    if request.method == 'GET':
       return render(request, 'dashboard/Banner/add_banner.html')
    
    else:
       title = request.POST.get('title')
       image = request.FILES['image']
      
       if not title or not image:
          return render(request, 'dashboard/Banner/add_banner.html', {'error':'All fields are required'})
     
       banner = Banner.objects.create(
          title = title,
          image = image
       )

       banner.save()
       return render(request, 'dashboard/Banner/add_banner.html/', {'success': 'Banner added successfully'})
    

def getBanners(request):
   if not request.user.is_authenticated:
     return redirect('/')
   banners = Banner.objects.all()
   return render(request,'dashboard/Banner/list_banner.html/', {'banners':banners})
   
def editBanner(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    banner = Banner.objects.get(id=id)
    return render(request, 'dashboard/Banner/edit_banner.html', {'banner': banner,})

def updateBanner(request, id):
    if not request.user.is_authenticated:
     return redirect('/')
    title = request.POST.get('title')
    if not title :
        return render(request, 'dashboard/Banner/edit_banner.html/', {'error': 'Title cannot be empty'})
    banner = Banner.objects.get(id = id)
    banner.title = title
    if bool(request.POST.get('image', False)) != False:
        banner.image = request.FILES['image']
    banner.save()
    return redirect('/banners/')

def deleteBanner(request, id):
    if not request.user.is_authenticated:
     return redirect('/')

    banner = Banner.objects.get(id = id)
    banner.delete()
    return redirect('/banners')

