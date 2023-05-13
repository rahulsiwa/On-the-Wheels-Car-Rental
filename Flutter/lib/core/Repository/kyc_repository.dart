import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_final/core/app_export.dart';

class KYC {
  var dio = Dio();
  var api = ApiURL();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getUserKyc() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    print('i am here');
    try {
      var result = await dio
          .get('${api.baseUrl}getUserKyc/${jsonDecodedUserDetail['id']}');
      var data = result.data;
      print(data);
      if (data['status'] == 200) {
        return data['KYC'];
      } else if (data['status'] == 500) {
        return 500;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }

  addKYC(XFile l, XFile i) async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var kycData = {
        'licenseImage': await MultipartFile.fromFile(l.path,
            filename: l.path.split('/').last),
        'identityImage': await MultipartFile.fromFile(i.path,
            filename: i.path.split('/').last),
        'user_id': jsonDecodedUserDetail['id']
      };
      var formData = FormData.fromMap(kycData);
      var result = await dio.post('${api.baseUrl}addKyc/', data: formData);
      var data = result.data;
      print(data);
      if (data['status'] == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }

  getUserProfile() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    print('i am here');
    try {
      var result = await dio
          .get('${api.baseUrl}getUserProfile/${jsonDecodedUserDetail['id']}');
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

  updateUserProfile(formData) async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    dio.options.headers["Authorization"] = "Bearer $jsonDecodedToken";
    try {
      var result = await dio.post(
          '${api.baseUrl}update-profile/${jsonDecodedUserDetail['id']}',
          data: formData);
      var data = result.data;

      if (data['status'] == 200) {
        return result.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }
}
