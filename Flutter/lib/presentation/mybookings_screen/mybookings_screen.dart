import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';

class MybookingsScreen extends StatefulWidget {
  @override
  State<MybookingsScreen> createState() => _MybookingsScreenState();
}

class _MybookingsScreenState extends State<MybookingsScreen> {
  bool isLoading = true;
  List myBooking = [];
  @override
  void initState() {
    getMyBooking();
    super.initState();
  }

  void getMyBooking() async {
    isLoading = true;

    setState(() {});
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var user = prefs.getString('user');
    var jsonDecodedToken = jsonDecode(token!);
    var jsonDecodedUser = jsonDecode(user!);
    print(user);
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    Map data = {"user": jsonDecodedUser['id']};
    var response =
        await dio.post("${ApiURL().baseUrl}get-bookings", data: data);
    var responseData = response.data;
    print(responseData);
    myBooking = responseData['bookings'];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("My Booking"),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: size.width,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: myBooking.length,
                    itemBuilder: (_, index) {
                      log(myBooking[index].toString());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(),
                              // color: Colors.white,
                              // boxShadow: [
                              //   BoxShadow(
                              //     // blurStyle: BlurStyle.,
                              //     color: Colors.black,
                              //     blurRadius: 2,
                              //     offset: Offset(2, 2),
                              //     spreadRadius: 2,
                              //   ),
                              // ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      ApiURL().imgUrl +
                                          myBooking[index]['car']['main_image'],
                                      height: 150,
                                      width: 150,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          myBooking[index]['car']['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "Booking Id: ${myBooking[index]['id']}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.spaceBetween,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Trip Start",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.MMMEd().format(
                                              (DateTime.parse(
                                                myBooking[index]['pick_date'],
                                              )),
                                            ),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Trip Start",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.MMMEd().format(
                                              (DateTime.parse(
                                                myBooking[index]['return_date'],
                                              )),
                                            ),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Paid",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            myBooking[index]['car']['price']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
          ),
        ),
      ),
    );
  }
}
