import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_final/presentation/caronlocation_screen/single_car.dart';

import '../../core/constants/constants.dart';

class SeachTaxi extends StatefulWidget {
  List taxi;
  SeachTaxi(this.taxi, {Key? key}) : super(key: key);

  @override
  State<SeachTaxi> createState() => _SeachTaxiState();
}

class _SeachTaxiState extends State<SeachTaxi> {
  TextEditingController _newTextEditingController = TextEditingController();

  void searchVehicle(String query) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Search Vehicle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _newTextEditingController,
              decoration: InputDecoration(hintText: "Search Your Vehicle"),
              onChanged: (value) {
                setState(() {});
              },
              onFieldSubmitted: (query) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.taxi.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 180),
              itemBuilder: (context, index) {
                var car = widget.taxi[index];
                if (widget.taxi[index]["name"]
                    .toString()
                    .toLowerCase()
                    .contains(
                        this._newTextEditingController.text.toLowerCase()))
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
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
          ],
        ),
      ),
    );
  }
}
