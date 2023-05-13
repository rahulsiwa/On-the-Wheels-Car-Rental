import 'package:dio/dio.dart';
import 'package:taxi_final/core/app_export.dart';

class Forgotpassword {
  var dio = Dio();
  var api = ApiURL();

  checkEmail(email) async {
    dynamic response;
    try {
      var res =
          await dio.post('${api.baseUrl}check-email/', data: {'email': email});
      if (res.data['status'] == 200) {
        response = true;
      } else {
        response = false;
      }
    } on DioError catch (_) {
      response = false;
    }
    return response;
  }

  updatePassword(data) async {
    dynamic response;
    try {
      var res = await dio.post('${api.baseUrl}update-password/', data: data);
      if (res.data['status'] == 200) {
        response = true;
      } else {
        response = false;
      }
    } on DioError catch (_) {
      print(_);
      response = false;
    }
    return response;
  }

  checkOtp(data) async {
    try {
      var res = await dio.post('${api.baseUrl}check-otp/', data: data);
      if (res.data['status'] == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      print(_);
      return false;
    }
  }
}
