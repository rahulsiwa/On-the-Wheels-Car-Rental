import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';
import 'dart:convert';

class WishList {
  var dio = Dio();
  var api = ApiURL();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  addToWhishList(int car_id) async {
    try {
      print('i ma hers');
      final SharedPreferences prefs = await _prefs;
      var token = prefs.getString('token');
      var jsonDecodedToken = jsonDecode(token!);
      var userDetails = prefs.getString('user');
      var jsonDecodedUserDetail = jsonDecode(userDetails!);
      dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
      var data = {"car_id": car_id, "user_id": jsonDecodedUserDetail['id']};
      var res = await dio.post('${api.baseUrl}add-to-whish/', data: data);
      var result = res.data;
      print(result);
      if (result['status'] == 200) {
        return true;
      }
    } on DioError catch (_) {
      print(_.message);
      return false;
    }
  }

  getProductsOfUserFromWhishList() async {
    dynamic response = false;
    try {
      final SharedPreferences prefs = await _prefs;
      var token = prefs.getString('token');
      var jsonDecodedToken = jsonDecode(token!);
      var userDetails = prefs.getString('user');
      var jsonDecodedUserDetail = jsonDecode(userDetails!);
      dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
      var res = await dio.get(
          '${api.baseUrl}get-wish-according-to-user/${jsonDecodedUserDetail['id']}');
      var result = res.data;
      print(result);
      if (result['status'] == 200) {
        return result['whishlists'];
      }
      return response;
    } on DioError catch (_) {
      response = false;
    }
  }

  deleteWishList(int wish_list_id) async {
    try {
      final SharedPreferences prefs = await _prefs;
      var token = prefs.getString('token');
      var jsonDecodedToken = jsonDecode(token!);
      dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
      var res = await dio.get('${api.baseUrl}delete-wish-item/$wish_list_id');
      var result = res.data;
      print(result);
      if (result['status'] == 200) {
        return true;
      }
    } on DioError catch (_) {
      print(_.message);
      return false;
    }
  }
}
