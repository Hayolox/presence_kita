import 'package:flutter/material.dart';
import 'package:presence_kita/screen/auth/auth_view_model.dart';
import 'package:presence_kita/screen/drawer/sus_view_model.dart';
import 'package:presence_kita/screen/komti/add_session_page.dart';
import 'package:presence_kita/screen/auth/signIn_student_page.dart';
import 'package:presence_kita/screen/drawer/change_password_page.dart';
import 'package:presence_kita/screen/drawer/permit_page.dart';
import 'package:presence_kita/screen/drawer/questionnaire_page.dart';
import 'package:presence_kita/screen/student/home/home_page.dart';
import 'package:presence_kita/screen/student/home/home_view_model.dart';
import 'package:presence_kita/screen/student/presence/license_page.dart';
import 'package:presence_kita/screen/student/presence/presence_page.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/screen/student/session/session_page.dart';
import 'package:presence_kita/screen/student/session/session_view_model.dart';
import 'package:presence_kita/screen/student/presence/sick_page.dart';
import 'package:presence_kita/screen/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthViewModel>(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider<SessionViewModel>(
        create: (context) => SessionViewModel(),
      ),
      ChangeNotifierProvider<SusViewModel>(
        create: (context) => SusViewModel(),
      ),
      ChangeNotifierProvider<PresenceViewModel>(
        create: (context) => PresenceViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => SessionLecturerPage(),
        '/': (context) => const SpalshScreenPage(),

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
      },
    );
  }
}
