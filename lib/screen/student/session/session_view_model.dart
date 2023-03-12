import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/model/api/session_api.dart';
import 'package:presence_kita/model/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionViewModel extends ChangeNotifier {
  final SessionApi _sessionApi = SessionApi();
  StatusState state = StatusState.loding;

  late SessionModel session;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataSession(String paramSubject) async {
    changeStatusState(StatusState.loding);
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('student');
    SessionModel getDataSession =
        await _sessionApi.getSession(items![0], paramSubject);
    session = getDataSession;
    notifyListeners();
    changeStatusState(StatusState.none);
  }

  presence(int paramSessionId, String paramSubjectCourseCode,
      DateTime paramDateSession, BuildContext context) {
    DateTime now = DateTime.now();

    if (now.isAfter(paramDateSession)) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Info',
        desc: 'Anda Tidak Bisa Melakukan Presensi',
        btnOkOnPress: () {},
      ).show();
    } else {
      Navigator.pushNamed(context, '/presencePage');
    }
  }
}
