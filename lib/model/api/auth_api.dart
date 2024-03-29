import 'package:dio/dio.dart';
import 'package:presence_kita/constant/API.dart';
import 'package:presence_kita/model/student_model.dart';

class AuthApi {
  final API _api = API();

  Future<StudentModel> signIn(
      String paramNim, String paramPassword, String paramAndroidId) async {
    final response = await _api.dio.post(
      'login-proses-student',
      data: {
        'nsn': paramNim,
        'password': paramPassword,
        'android_id': paramAndroidId
      },
    );

    return StudentModel.fromJson(response.data['data']);
  }

  Future register(Map<String, dynamic> paramData) async {
    final response = await _api.dio.post(
      'login-proses-register',
      data: paramData,
    );

    return response;
  }

  Future changePassword(
      Map<String, dynamic> paramDataPass, String paramToken) async {
    var response = await _api.dio.post('change-password',
        data: paramDataPass,
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));
    return response;
  }
}
