import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: FractionalOffset.center,
        height: 80.0,
        padding: const EdgeInsets.all(20.0),
        child: const CircularProgressIndicator());
  }
}
