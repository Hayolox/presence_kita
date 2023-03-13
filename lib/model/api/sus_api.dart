import 'package:dio/dio.dart';
import 'package:presence_kita/constant/api.dart';
import 'package:presence_kita/model/sus_question_model.dart';

class SusApi {
  final API _api = API();

  Future<Map<String, dynamic>> getQuestionSus(String paramToken) async {
    var response = await _api.dio.get('sus-Question',
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));

    return response.data['data'];
  }

  Future submitSUS(String paramToken, Map<String, dynamic> paramAnswer) async {
    var response = await _api.dio.post('sus-Answer',
        data: paramAnswer,
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));

    return response;
  }
}
