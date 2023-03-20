import 'package:dio/dio.dart';
import 'package:presence_kita/constant/API.dart';

import 'package:presence_kita/model/session_pratikum_model.dart';

class SessionPratikumApi {
  final API _api = API();

  Future<SessionPratikumModel> getSession(
      String paramToken, int paramClassroomsId) async {
    final response = await _api.dio
        .get('session-pratikum?classroomspratikum_id=$paramClassroomsId',
            options: Options(
              headers: {
                "authorization": "Bearer $paramToken",
              },
            ));
    return SessionPratikumModel.fromJson(response.data['data']);
  }
}
