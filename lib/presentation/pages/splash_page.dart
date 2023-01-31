import 'dart:async';

import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class SpalshScreenPage extends StatefulWidget {
  const SpalshScreenPage({super.key});

  @override
  State<SpalshScreenPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshScreenPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        Navigator.pushReplacementNamed(context, '/onePage');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DelayedDisplay(
          delay: const Duration(seconds: 1),
          child: Image.asset(
            'assets/logo_upr.png',
            width: 200,
          ),
        ),
      ),
    );
  }
}
