import 'package:dio/dio.dart';
import 'package:presence_kita/constant/API.dart';
import 'package:presence_kita/model/home_model.dart';

class HomeApi {
  final API _api = API();

  Future<HomeModel> getDataHome(String paramToken) async {
    final response = await _api.dio.get('home',
        options: Options(
          headers: {
            "authorization": "Bearer $paramToken",
          },
        ));
    return HomeModel.fromJson(response.data['data']);
  }
}
