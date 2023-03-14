import 'package:dio/dio.dart';
import 'package:presence_kita/constant/api.dart';
import 'dart:io';
import 'dart:math';

class PresenceApi {
  final API _api = API();

  Future presence(Map<String, dynamic> paramData, String paramToken) async {
    var response = await _api.dio.post('presence-present',
        data: paramData,
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));

    return response;
  }

  Future izin(File paramFile, int paramSessiionId,
      String paramSubjectCourseCode, String paramToken) async {
    Random random = Random();
    int randomNumber = random.nextInt(20);

    FormData formData = FormData.fromMap({
      'izin': await MultipartFile.fromFile(paramFile.path,
          filename: '$randomNumber.pdf'),
      'session_id': paramSessiionId,
      'subject_course_code': paramSubjectCourseCode,
    });

    var response = await _api.dio.post('presence-izin',
        data: formData,
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));
    return response;
  }
}
