import 'package:flutter/material.dart';
import 'package:presence_kita/theme.dart';

class PresenceTwoPage extends StatelessWidget {
  const PresenceTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          'Session 1',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Text(
              'Hizbullah Haidar Anis Al Wakil ST',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              'Batas Presensi Masuk : 09.30',
              style: primaryTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Batas Presensi Keluar : 10.30',
              style: primaryTextStyle,
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              'Presensi Masuk Kamu: 09.30',
              style: primaryTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Presensi Keluar Kamu: 10.30',
              style: primaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
