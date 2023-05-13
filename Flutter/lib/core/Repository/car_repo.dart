import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';
import 'dart:convert';

class CarRepo {
  var dio = Dio();
  var api = ApiURL();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getCars() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
  
    var jsonDecodedToken = jsonDecode(token!);
 
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio.get('${api.baseUrl}cars/');
      var data = result.data;
      if (data['status'] == 200) {
        return data['cars'];
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }

  getBanners() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio.get('${api.baseUrl}banners/');
      var data = result.data;
      if (data['status'] == 200) {
        return data['banners'];
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }
}
