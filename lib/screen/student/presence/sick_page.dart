
import 'package:flutter/material.dart';
import 'package:presence_kita/theme.dart';

class SickPage extends StatelessWidget {
  const SickPage({super.key});

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
          'Surat Sakit',
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
            Text(
              'Surat Sakit',
              style: primaryTextStyle,
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () async {},
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pilih File",
                          style: primaryTextStyle.copyWith(color: Colors.grey),
                        ),
                        Icon(
                          Icons.attach_file,
                          size: 20,
                          color: Colors.grey.shade600,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
