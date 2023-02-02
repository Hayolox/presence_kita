import 'package:flutter/material.dart';
import 'package:presence_kita/presentation/pages/add_session_page.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_lecturer_page.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_student_page.dart';
import 'package:presence_kita/presentation/pages/drawer/change_password_page.dart';
import 'package:presence_kita/presentation/pages/drawer/permit_page.dart';
import 'package:presence_kita/presentation/pages/drawer/questionnaire_page.dart';
import 'package:presence_kita/presentation/pages/student/home_page.dart';
import 'package:presence_kita/presentation/pages/student/license_page.dart';
import 'package:presence_kita/presentation/pages/one_page.dart';
import 'package:presence_kita/presentation/pages/student/presence_page.dart';
import 'package:presence_kita/presentation/pages/student/presence_two_page.dart';
import 'package:presence_kita/presentation/pages/student/session_page.dart';
import 'package:presence_kita/presentation/pages/student/sick_page.dart';
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
        // '/': (context) => SessionPage(),
        '/': (context) => const SpalshScreenPage(),
        '/onePage': (context) => const OnePage(),
        '/signInStudentPage': (context) => SignInStudentPage(),
        '/signInLecturerPage': (context) => SignInLecturerPage(),
        '/homePage': (context) => const HomePage(),
        '/changePasswordPage': (context) => ChangePasswordPage(),
        '/permitPage': (context) => const PermitPage(),
        '/question': (context) => const QuestionnairePage(),
        '/sessionPage': (context) => const SessionPage(),
        '/presencePage': (context) => const PresencePage(),
        '/licensePage': (context) => const LicenseePage(),
        '/sickPage': (context) => const SickPage(),
        '/addSessionPage': (context) => AddSessionPage(),
      },
    );
  }
}
