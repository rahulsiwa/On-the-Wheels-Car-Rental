import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/Repository/auth_repository.dart';
import 'package:taxi_final/core/Repository/car_repo.dart';
import 'package:taxi_final/core/Repository/category_repository.dart';
import 'package:taxi_final/core/Repository/wish_repo.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/caronlocation_screen/single_car.dart';
import 'package:taxi_final/presentation/search/search.dart';

class CarIndex extends StatefulWidget {
  const CarIndex({Key? key}) : super(key: key);

  @override
  State<CarIndex> createState() => _CarIndexState();
}

class _CarIndexState extends State<CarIndex> {
  var switchValue = false;
  int selectedIndex = -1;
  List categories = [];
  List cars = [];
  List filteredCars = [];
  List banners = [];
  bool isLoading = true;
  bool isFilterLoading = false;
  bool isAddedToWhishList = false;
  bool withDriver = true;
  int switchCategory = -1;

  @override
  void initState() {
    super.initState();
    getCategories();
    getBanners();
    getCars();
  }

  checkFavorite() async {
    var carRepo = CarRepo();
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');
    var user = prefs.getString("user");
    var jsonDecodedToken = jsonDecode(token!);
    carRepo.dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    var jsonDecodedUser = jsonDecode(user!);
    var response = await carRepo.dio.get(
        "${carRepo.api.baseUrl}get-wish-according-to-user/${jsonDecodedUser['id']}");
    var wishes = response.data['whishlists'];

    for (var car in cars) {
      for (var wish in wishes) {
        print(wish);
        print(car);
        if (car['id'] == wish['car_id']['id']) {
          car['isInWish'] = true;
        }
      }
    }
    setState(() {});
  }

  getCategories() async {
    var res = await CatRepo().getCategories();
    if (res != false) {
      setState(() {
        categories = res;
      });
    }
  }

  getCars() async {
    var res = await CarRepo().getCars();
    if (res != false) {
      setState(() {
        cars = res;
        filteredCars = res;
        isLoading = false;
        checkFavorite();
      });
    }
  }

  getBanners() async {
    var res = await CarRepo().getBanners();
    print(res);
    if (res != false) {
      setState(() {
        banners = res;
      });
    }
  }

  getProductsAccordingToCategory(id) async {
    setState(() {
      isFilterLoading = true;
    });
    var res = await CatRepo().getProductAccordingToCategory(id);
    if (res != false) {
      setState(() {
        cars = res;
        isFilterLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              SizedBox(
                height: 10,
              ),
              banners.isEmpty
                  ? Center(
                      child: Row(
                        children: [
                          Text('Your ads will be shown here'),
                          IconButton(
                              icon: Icon(
                                Icons.search,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SeachTaxi(this.cars)));
                                // showSearch(context: context,delegate: SearchTaxi());
                              })
                        ],
                      ),
                    )
                  : CarouselSlider(
                      options: CarouselOptions(height: 160.0),
                      items: banners.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Container(
                                height: 160,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment(0.8, 0.0),
                                      colors: <Color>[
                                        Color(0XFFE5B8F4),
                                        Color(0XFFE5B8F4),
                                      ], // red to yellow
                                      tileMode: TileMode
                                          .repeated, // repeats the gradient over the canvas
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 26, 2, 54))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        i['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Image(
                                            image: NetworkImage(
                                                ApiURL().imgUrl + i['image'])),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: categories.isEmpty
                    ? Center(
                        child: Text('No any categories'),
                      )
                    : Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                cars = filteredCars;
                                switchCategory = -1;
                              });
                            },
                            child: Chip(
                              label: Text(
                                'All',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.purple[900],
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(31, 4, 65, 1))),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  var data = categories[index];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        switchCategory = data['id'];
                                      });
                                      getProductsAccordingToCategory(
                                          categories[index]['id']);
                                    },
                                    child: Chip(
                                      label: Text(
                                        data['name'],
                                        style: TextStyle(
                                            color: index == selectedIndex
                                                ? Colors.white
                                                : Colors.purple[900]),
                                      ),
                                      backgroundColor: index == selectedIndex
                                          ? Colors.purple[900]
                                          : Colors.transparent,
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  31, 4, 65, 1))),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available Near You",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold20,
                        ),
                        Text(
                          switchCategory == -1
                              ? "All cars"
                              : withDriver == true
                                  ? "With driver"
                                  : "Without driver",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOrientaRegular163,
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SeachTaxi(this.cars)));
                          // showSearch(context: context,delegate: SearchTaxi());
                        }),
                    Switch(
                        activeColor: Colors.purple[900],
                        value: withDriver,
                        onChanged: (val) {
                          setState(() {
                            cars = filteredCars;
                          });
                          if (val == true) {
                            if (switchCategory == -1) {
                              var filteredCars = cars.where((element) {
                                return element['driver'] == true;
                              }).toList();
                              setState(() {
                                withDriver = val;
                                cars = filteredCars;
                              });
                            } else {
                              var filteredCars = cars.where((element) {
                                return element['driver'] == true &&
                                    switchCategory == element['category'];
                              }).toList();
                              setState(() {
                                withDriver = val;
                                cars = filteredCars;
                              });
                            }
                          } else {
                            if (switchCategory == -1) {
                              var filteredCars = cars.where((element) {
                                return element['driver'] == false;
                              }).toList();
                              setState(() {
                                withDriver = val;
                                cars = filteredCars;
                              });
                            } else {
                              var filteredCars = cars.where((element) {
                                return element['driver'] == false &&
                                    switchCategory == element['category'];
                              }).toList();
                              setState(() {
                                withDriver = val;
                                cars = filteredCars;
                              });
                            }
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: cars.isEmpty
                    ? Center(
                        child: Text('No any cars to show'),
                      )
                    : isFilterLoading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            itemCount: cars.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    mainAxisExtent: 180),
                            itemBuilder: (context, index) {
                              var car = cars[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SingleCar(
                                                carDetails: car,
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Image(
                                                    image: CachedNetworkImageProvider(
                                                        ApiURL().imgUrl +
                                                            car['main_image'])),
                                              ),
                                              Positioned(
                                                  top: 1,
                                                  right: 1,
                                                  child: InkWell(
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          var res =
                                                              await WishList()
                                                                  .addToWhishList(
                                                                      car['id']);
                                                          if (res == true) {
                                                            setState(() {
                                                              isAddedToWhishList =
                                                                  true;
                                                              cars[index][
                                                                      'isInWish'] =
                                                                  true;
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    content: Text(
                                                                        'Added to whishlist')));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content: Text(
                                                                        'Error: Not Added to whishlist')));
                                                          }
                                                        },
                                                        icon: cars[index][
                                                                        'isInWish'] ==
                                                                    null ||
                                                                cars[index][
                                                                        'isInWish'] ==
                                                                    false
                                                            ? Icon(Icons
                                                                .favorite_outline)
                                                            : Icon(
                                                                Icons.favorite,
                                                              ),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          car['name'],
                                          style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RatingBar.builder(
                                          initialRating: 3,
                                          itemSize: 15,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        Text(
                                          car['seater'],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Price.${car['price']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              )
            ]),
    );
  }
}
