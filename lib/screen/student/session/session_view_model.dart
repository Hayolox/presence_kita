import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/model/api/session_api.dart';
import 'package:presence_kita/model/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionViewModel extends ChangeNotifier {
  final SessionApi _sessionApi = SessionApi();
  late String roles;
  StatusState state = StatusState.loding;
  DateTime now = DateTime.now();

  late SessionModel session;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataSession(int paramClassroomsId) async {
    changeStatusState(StatusState.loding);
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('student');
    SessionModel getDataSession =
        await _sessionApi.getSession(items![0], paramClassroomsId);

    session = getDataSession;
    roles = getDataSession.roles;
    notifyListeners();
    changeStatusState(StatusState.none);
  }

  presence(
      int paramSessionId,
      int paramClassroomsId,
      DateTime paramDateSession,
      String paramFinishSession,
      Map<String, dynamic> argument,
      BuildContext context) {
    if (now.year == paramDateSession.year &&
        now.month == paramDateSession.month &&
        now.day == paramDateSession.day) {
      Navigator.pushNamed(context, '/presencePage', arguments: argument);
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Info',
        desc: 'Anda Tidak Bisa Melakukan Presensi',
        btnOkOnPress: () {},
      ).show();
    }
  }
}
