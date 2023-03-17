import 'package:flutter/material.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/model/api/home_api.dart';
import 'package:presence_kita/model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeApi _homeApi = HomeApi();
  StatusState state = StatusState.loding;

  late HomeModel dataHome;
  late List<String> student;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataHome() async {
    changeStatusState(StatusState.loding);

    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('student');
    student = items!;

    HomeModel resultDataHome = await _homeApi.getDataHome(items[0]);

    dataHome = resultDataHome;

    notifyListeners();
    changeStatusState(StatusState.none);
  }
}
