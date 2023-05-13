import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_final/core/Repository/auth_repository.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/bookinformation_screen/bookinformation_screen.dart';

class SingleCar extends StatefulWidget {
  final dynamic carDetails;
  const SingleCar({Key? key, required this.carDetails}) : super(key: key);

  @override
  State<SingleCar> createState() => _SingleCarState();
}

class _SingleCarState extends State<SingleCar> {
  List<String> images = [];
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    images.add(widget.carDetails['main_image']);
    for (var element in widget.carDetails['images']) {
      images.add(element['image']);
    }
    getUserData();
  }

  getUserData() async {
    var res = await AuthRepository().getUserData();
    if (res['isApproved'] == true) {
      setState(() {
        isVerified = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          if (isVerified == false && widget.carDetails['driver'] == false) {
            showDialog(
              context: context,
              builder: (context) {
                return UnconstrainedBox(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.offline_bolt_sharp,
                                size: 40,
                                color: Colors.amber,
                              ),
                              Text(
                                  'Please verify your documents to book this vehicle'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Bookinginformation(widget.carDetails),
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 50,
          color: Color(0XFFE5B8F4),
          child: Center(
            child: Text(
              'Book Now',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
                child: CarouselSlider(
              options: CarouselOptions(height: 160.0),
              items: images.map<Widget>((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        height: 160,
                        padding: EdgeInsets.all(8),
                        child: SizedBox(
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(ApiURL().imgUrl + i)),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.carDetails['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2D033B)),
            ),
            SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              initialRating: 3,
              itemSize: 15,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.yellow[900],
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Specs',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2D033B)),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              'Max power',
                              style: TextStyle(color: Color(0XFF6C757D)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('${widget.carDetails['max_power']} BPH',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              'Top speed',
                              style: TextStyle(color: Color(0XFF6C757D)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('${widget.carDetails['top_speed']} Km/hr',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              'Motor',
                              style: TextStyle(color: Color(0XFF6C757D)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('${widget.carDetails['motor']} cc',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Features',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2D033B)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.air_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                  widget.carDetails['air_conditioner'] == true
                                      ? 'Air conditioner'
                                      : 'No air conditioner'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.music_note),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(widget.carDetails['music'] == true
                                  ? 'Music'
                                  : 'No Music'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.chair),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(widget.carDetails['seater']),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.sunny),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(widget.carDetails['sun_roof'] == true
                                  ? 'Sun roof'
                                  : 'No sun roof'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2D033B)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(widget.carDetails['description']),
          ],
        ),
      ),
    );
  }
}
