import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:presence_kita/theme.dart';

class SessionLecturerPage extends StatelessWidget {
  const SessionLecturerPage({super.key});

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
          'Session',
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
              'Pemograman Web & Mobile I',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/confirmStudentPage'),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: pinkColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            '8',
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Izin Mahasiswa',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/addSessionPage'),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                      Text(
                        'Tambah Session',
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              'Session',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 16,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/presencePage'),
                    child: Container(
                      height: 84,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 19, horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pertemuan 1',
                            style: primaryTextStyle,
                          ),
                          Text(
                            '09:30 am',
                            style: primaryTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
