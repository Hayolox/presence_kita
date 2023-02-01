import 'package:flutter/material.dart';
import 'package:presence_kita/theme.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String title;
  const SubmitButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 128,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(
        title,
        style: primaryTextStyle.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
