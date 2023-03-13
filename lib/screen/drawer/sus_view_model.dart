import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/model/api/sus_api.dart';
import 'package:presence_kita/model/sus_question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SusViewModel extends ChangeNotifier {
  final SusApi _api = SusApi();
  StatusState state = StatusState.loding;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  String currentIndex = 'Q1';
  int intCurrentIndex = 0;

  List<String> question = [
    'Q1',
    'Q2',
    'Q3',
    'Q4',
    'Q5',
    'Q6',
    'Q7',
    'Q8',
    'Q9',
    'Q10'
  ];

  List answerStudent = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<String> choiceAnswer = [
    'Sangat Tidak Setuju',
    'Tidak Setuju',
    'Ragu-ragu',
    'Setuju',
    'Sangat Setuju'
  ];

  late Map<String, dynamic> susQuestion;

  getQuestion() async {
    changeStatusState(StatusState.loding);
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('student');
    susQuestion = await _api.getQuestionSus(items![0]);
    notifyListeners();
    changeStatusState(StatusState.none);
  }

  changeAnswer(int index) {
    intCurrentIndex = index;
    currentIndex = question[index];
    notifyListeners();
  }

  chooseAnswer(int index) {
    answerStudent[intCurrentIndex] = index;
    notifyListeners();
  }

  submit(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('student');

    for (int i = 0; i <= 9; i++) {
      int numberQuestion = i + 1;

      if (numberQuestion % 2 == 0) {
        answerStudent[i] = 5 - answerStudent[i];
      } else {
        answerStudent[i] = answerStudent[i] - 1;
      }
    }

    var sum = answerStudent.reduce((a, b) => a + b);
    double amount = sum * 2.5;

    Map<String, dynamic> answer = {
      'Q1': answerStudent[0],
      'Q2': answerStudent[1],
      'Q3': answerStudent[2],
      'Q4': answerStudent[3],
      'Q5': answerStudent[4],
      'Q6': answerStudent[5],
      'Q7': answerStudent[6],
      'Q8': answerStudent[7],
      'Q9': answerStudent[8],
      'Q10': answerStudent[9],
      'amount': amount,
    };

    await _api.submitSUS(items![0], answer);
    // ignore: use_build_context_synchronously
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'INFO',
      desc: 'Berhasil Mengisi Kusioner',
    ).show();
    answerStudent = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ];

    Timer(
      const Duration(seconds: 2),
      () => Navigator.pop(context),
    );
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamedAndRemoveUntil(
          context, '/homePage', (route) => false),
    );
  }
}
