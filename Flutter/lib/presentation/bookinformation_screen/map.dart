import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';

class LocationMap extends StatefulWidget {
  final dynamic bookingInfo;
  const LocationMap({Key? key, required this.bookingInfo}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  List<latLng.LatLng> latlng = [latLng.LatLng(51.509364, -0.128925)];
  MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator.getCurrentPosition();
    setState(() {
      latlng = [latLng.LatLng(position.latitude, position.longitude)];
    });
    _mapController.move(
      latLng.LatLng(position.latitude, position.longitude),
      10.0, // Zoom level
    );
    return position;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.bookingInfo);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              onTap: (postiio, latLong) {
                if (this.latlng.length >= 2) {
                  latlng.clear();
                }
                latlng.add(latLong);
                setState(() {});
              },
              center: latlng.first,
              zoom: 9.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  for (int i = 0; i < latlng.length; i++)
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: latlng[i],
                      builder: (ctx) => SizedBox(
                        child: Column(
                          children: [
                            i == 0 ? Text("Start") : Text("End"),
                            Icon(
                              Icons.location_on,
                              color: i == 0 ? Colors.red : Colors.blue,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 100,
              right: 100,
              child: ElevatedButton(
                  onPressed: () async {
                    if (latlng.length < 2) {
                      SnackBar _snackBar = SnackBar(
                          content: Text(
                              "Please Choose both starting and end position"));
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                      return;
                    }
                  
                    payWithKhalti(context);
                  },
                  child: Text('Continue')))
        ],
      ),
    );
  }

  payWithKhalti(BuildContext context) {
    int total = widget.bookingInfo['carinfo']['price'];
    String name = widget.bookingInfo['carinfo']['name'];
    var config = PaymentConfig(
        amount: total * 100, productIdentity: name, productName: name);

    KhaltiScope.of(context).pay(
      config: config,
      onSuccess: (result) {
        postOrder();
      },
      onFailure: (result) {
        SnackBar _snackBar =
            new SnackBar(content: Text("Failed to make payment"));
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      },
    );
  }

  void postOrder() async {
    Dio dio = Dio();
    dio.options.headers[HttpHeaders.authorizationHeader] = "";
    var _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString('token');
    var user = prefs.getString('user');

    var jsonDecodedToken = jsonDecode(token!);
    var jsonDecodedUser = jsonDecode(user!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    Map data = {
      "car": widget.bookingInfo['carinfo']['id'],
      "user": jsonDecodedUser['id'],
      "pick_date": widget.bookingInfo['pickup'].toString(),
      "return_date": widget.bookingInfo['return'].toString(),
      "pick_location": latlng[0],
      "drop_location": latlng[1],
    };

    var response = await dio.post("${ApiURL().baseUrl}add-booking", data: data);
    data = response.data;
    if (data['status'] == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      SnackBar snackBar = SnackBar(
        content: Text(
          "Booked Successfully",
        ),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    print(data);
  }
}
