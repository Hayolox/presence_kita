import 'package:flutter/material.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_major_page.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_student_page.dart';
import 'package:presence_kita/presentation/pages/change_password_page.dart';
import 'package:presence_kita/presentation/pages/home_page.dart';
import 'package:presence_kita/presentation/pages/one_page.dart';
import 'package:presence_kita/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ChangePasswordPage(),
        // '/': (context) => const SpalshScreenPage(),
        // '/onePage': (context) => const OnePage(),
        // '/signInStudentPage': (context) => SignInStudentPage(),
        // '/signInMajorPage': (context) => SignInMajortPage(),
        // '/homePage': (context) => const HomePage(),
      },
    );
  }
}
