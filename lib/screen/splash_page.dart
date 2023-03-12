import 'dart:async';

import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final prefs = await SharedPreferences.getInstance();
        final List<String>? items = prefs.getStringList('student');
        if (items == null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/signInStudentPage');
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/homePage');
        }
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
