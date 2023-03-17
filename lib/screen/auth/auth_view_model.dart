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
        student.student.nsn,
        student.student.roles
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
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  void register(String paramNim, String paramName, String paramPassword,
      BuildContext context) async {
    print("masuuukk sini");
    try {
      Map<String, dynamic> data = {
        'nsn': paramNim,
        'name': paramPassword,
        'password': paramPassword,
      };

      await _authApi.register(data);

      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'INFO',
        desc: 'Akun Berhasil Didaftarkan',
      ).show();
    } on DioError catch (e) {
      if (e.response?.statusCode == 406) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'INFO',
          desc: 'Akun Sudah Terdaftar',
          btnOkOnPress: () {},
        ).show();
      }
    }
  }

  changePasswrod(String paramOldPass, String newPass, String confirmNewPass,
      BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('student');

      Map<String, dynamic> dataPass = {
        'old_password': paramOldPass,
        'new_password': newPass,
      };

      await _authApi.changePassword(dataPass, items![0]);
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'INFO',
        desc: 'Password Berhasil Di Ubah',
        btnOkOnPress: () {},
      ).show();
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'INFO',
          desc: 'Password Lama Salah',
          btnOkOnPress: () {},
        ).show();
      }
    }
  }
}
