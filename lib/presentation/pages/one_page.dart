import 'package:flutter/material.dart';
import 'package:presence_kita/theme.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/signInStudentPage'),
              child: Container(
                height: 77,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 19, right: 19),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Mahasiswa',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                  context, '/signInLecturerPage'),
              child: Container(
                height: 77,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 19, right: 19),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Dosen',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
