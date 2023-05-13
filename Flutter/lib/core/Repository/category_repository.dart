import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';

class CatRepo {
  var dio = Dio();
  var api = ApiURL();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getCategories() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio.get('${api.baseUrl}categories/');
      var data = result.data;
      if (data['status'] == 200) {
        return data['categories'];
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }

  getProductAccordingToCategory(id) async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result =
          await dio.get('${api.baseUrl}cars-according-to-category/$id');
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
}
