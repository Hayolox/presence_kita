import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:presence_kita/model/api/presence_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class PresenceViewModel extends ChangeNotifier {
  final PresenceApi _api = PresenceApi();

  late String start;
  late String finish;
  late String geolocation;
  late double latitude;
  late double longitude;

  late String nameLecturer;
  late String qrCode;
  late String subjectCourseCode;
  late int sessionId;

  StatusState state = StatusState.loding;
  DateTime now = DateTime.now();

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  loadingPresence(
    String paramNameLecturer,
    String paramSubjectCourseCode,
    int paramSessionId,
    String paramStart,
    String paramFinish,
    String paramGeolocation,
    double paramLatitude,
    double paramLongitude,
  ) {
    changeStatusState(StatusState.loding);
    nameLecturer = paramNameLecturer;
    subjectCourseCode = paramSubjectCourseCode;
    sessionId = paramSessionId;
    start = paramStart;
    finish = paramFinish;
    geolocation = paramGeolocation;
    latitude = paramLatitude;
    longitude = paramLongitude;
    notifyListeners();
    changeStatusState(StatusState.none);
  }

  present(BuildContext context) async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      final prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('student');

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double distanceInMeters = Geolocator.distanceBetween(
          position.latitude, position.longitude, latitude, longitude);

      String qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', // Warna toolbar
        'Cancel', // Teks tombol batal
        true, // Mengaktifkan mode scan otomatis
        ScanMode.QR, // Mode scan yang ingin digunakan
      );

      if (qrCodeResult.isNotEmpty) {
        qrCode = qrCodeResult;
        changeStatusState(StatusState.loding);

        if (position.isMocked) {
          // ignore: use_build_context_synchronously
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Info',
            desc: 'Anda Kedeteksi Menggunakan Fake GPS',
            btnOkOnPress: () {},
          ).show();
          changeStatusState(StatusState.none);
        } else {
          if (distanceInMeters < 10) {
            Map<String, dynamic> data = {
              'QrCode': qrCode,
              'session_id': sessionId,
              'subject_course_code': subjectCourseCode,
              'status': 'hadir'
            };
            await _api.presence(data, items![0]);
            changeStatusState(StatusState.none);
            // ignore: use_build_context_synchronously
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Info',
              desc: 'Berhasil Presensi Hadir',
            ).show();

            Timer(
              const Duration(seconds: 2),
              () => Navigator.pop(context),
            );
            Timer(
              const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                  context, '/homePage', (route) => false),
            );
          } else {
            log(position.latitude.toString());
            log(position.longitude.toString());
            // ignore: use_build_context_synchronously
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Info',
              desc: 'Anda Diluar Jarak Yang Di Tentukan',
            ).show();
            changeStatusState(StatusState.none);
          }
        }
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'INFO',
          desc: 'Silahkan Scan QrCode Ulang',
          btnOkOnPress: () {},
        ).show();
        changeStatusState(StatusState.none);
      }
    }
  }
}
