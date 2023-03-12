import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/model/api/auth_api.dart';
import 'package:presence_kita/model/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthApi _authApi = AuthApi();

  void signIn(String paramNim, String paramPassword, String paramAndroidId,
      BuildContext context) async {
    try {
      StudentModel student =
          await _authApi.signIn(paramNim, paramPassword, paramAndroidId);

      final prefs = await SharedPreferences.getInstance();

      await prefs.setStringList('student', <String>[
        student.accessToken,
        student.student.name,
        student.student.nsn
      ]);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/homePage');
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'INFO',
          desc: 'Nim Atau Password Salah',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }

      if (e.response?.statusCode == 404) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'PERINGATAN',
          desc: 'Anda Terdeteksi Melakukan Kecurangan, Silahkan Hubungi Staff',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }
    }
  }
}
