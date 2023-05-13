import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';

var username;
var userImage;

class AuthRepository {
  var dio = Dio();
  var api = ApiURL();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future login(email, password) async {
    dynamic response;
    final SharedPreferences prefs = await _prefs;
    try {
      var result = await dio.post(
        '${api.baseUrl}login/',
        data: {"email": email, "password": password},
      );
      var decodedData = result.data;
      log(decodedData.toString());
      if (decodedData['status'] == 200) {
        response = true;
        prefs.setString('user', jsonEncode(decodedData['user']));
        username = decodedData['user']['name'];
        prefs.setString('token', jsonEncode(decodedData['access_token']));
      } else if (decodedData['status'] == 401) {
        response = 401;
      } else if (decodedData['status'] == 404) {
        response = 404;
      }
    } on DioError catch (_) {
      response = false;
    }
    return response;
  }

  register(data) async {
    dynamic response;
    try {
      var result = await dio.post(
        '${api.baseUrl}register/',
        data: data,
      );
      var decodedData = result.data;

      if (decodedData['status'] == 200) {
        response = 200;
      } else if (decodedData['status'] == 401) {
        response = 401;
      }
    } on DioError catch (_) {
      response = 400;
    }
    return response;
  }

  Future<bool> logout() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio.get(
        '${api.baseUrl}logout/',
      );
      var decodedData = result.data;
      if (decodedData['status'] == 200) {
        prefs.remove('user');
        prefs.remove('token');
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      print(_.message);
      return false;
    }
  }

  getUserData() async {
    final SharedPreferences prefs = await _prefs;
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    return jsonDecodedUserDetail;
  }

  getUserProfile() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio
          .get('${api.baseUrl}get-single-user/${jsonDecodedUserDetail['id']}');
      var data = result.data;
      if (data['status'] == 200) {
        return data['user'];
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }
}
