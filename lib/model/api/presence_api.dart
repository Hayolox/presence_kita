import 'package:dio/dio.dart';
import 'package:presence_kita/constant/api.dart';

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
}
