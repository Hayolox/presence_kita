import 'package:flutter/material.dart';
import 'package:presence_kita/presentation/pages/add_session_page.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_lecturer_page.dart';
import 'package:presence_kita/presentation/pages/auth/signIn_student_page.dart';
import 'package:presence_kita/presentation/pages/drawer/change_password_page.dart';
import 'package:presence_kita/presentation/pages/drawer/permit_page.dart';
import 'package:presence_kita/presentation/pages/drawer/questionnaire_page.dart';
import 'package:presence_kita/presentation/pages/lecturer/confirm_student_page.dart';
import 'package:presence_kita/presentation/pages/lecturer/home_lecturer_page.dart';
import 'package:presence_kita/presentation/pages/lecturer/session_lecturer_page.dart';
import 'package:presence_kita/presentation/pages/student/home_page.dart';
import 'package:presence_kita/presentation/pages/student/license_page.dart';
import 'package:presence_kita/presentation/pages/one_page.dart';
import 'package:presence_kita/presentation/pages/student/presence_page.dart';
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
        // '/': (context) => ConfirmStudentPage(),
        '/': (context) => const SpalshScreenPage(),
        '/onePage': (context) => const OnePage(),

        //Global Page
        '/changePasswordPage': (context) => ChangePasswordPage(),
        '/addSessionPage': (context) => AddSessionPage(),

        //Student Page
        '/signInStudentPage': (context) => SignInStudentPage(),
        '/homePage': (context) => const HomePage(),
        '/permitPage': (context) => const PermitPage(),
        '/question': (context) => const QuestionnairePage(),
        '/sessionPage': (context) => const SessionPage(),
        '/presencePage': (context) => const PresencePage(),
        '/licensePage': (context) => const LicenseePage(),
        '/sickPage': (context) => const SickPage(),

        //Lecturer Page
        '/signInLecturerPage': (context) => SignInLecturerPage(),
        '/homeLecturerPage': (context) => const HomeLecturerPage(),
        '/sessionLecturerPage': (context) => const SessionLecturerPage(),
        '/confirmStudentPage': (context) => const ConfirmStudentPage(),
      },
    );
  }
}
