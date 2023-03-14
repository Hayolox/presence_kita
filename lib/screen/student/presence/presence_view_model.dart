import 'package:flutter/material.dart';
import 'package:presence_kita/constant/state.dart';

class PresenceViewModel extends ChangeNotifier {
  StatusState state = StatusState.loding;
  DateTime now = DateTime.now();

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  loadingPresence() {
    changeStatusState(StatusState.loding);
    changeStatusState(StatusState.none);
  }

  present() {}
}
