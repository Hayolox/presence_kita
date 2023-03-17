import 'package:dio/dio.dart';
import 'package:presence_kita/constant/API.dart';
import 'package:presence_kita/model/session_model.dart';

class SessionApi {
  final API _api = API();

  Future<SessionModel> getSession(
      String paramToken, int paramClassroomsId) async {
    final response =
        await _api.dio.get('session-subject?classrooms_id=$paramClassroomsId',
            options: Options(
              headers: {
                "authorization": "Bearer $paramToken",
              },
            ));
    return SessionModel.fromJson(response.data['data']);
  }
}
