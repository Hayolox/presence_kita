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
}
