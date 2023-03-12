import 'package:flutter/material.dart';
import 'package:presence_kita/theme.dart';

class SubmitButtonPresenceWidget extends StatelessWidget {
  final String title;
  final Color color;
  const SubmitButtonPresenceWidget(
      {super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 73,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
