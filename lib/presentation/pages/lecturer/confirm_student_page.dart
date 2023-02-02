import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:presence_kita/theme.dart';

class ConfirmStudentPage extends StatelessWidget {
  const ConfirmStudentPage({super.key});

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
          'Konfirmasi',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: 140,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hizbullah',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '193010503011',
                          style: primaryTextStyle,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/logo_pdf.png',
                      width: 50,
                    ),
                    Text(
                      'Suran Izin',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 28,
                      width: 115,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          'Terima',
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 28,
                      width: 115,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          'Tolak',
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
