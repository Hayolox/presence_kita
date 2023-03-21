import 'package:flutter/material.dart';
import 'package:presence_kita/screen/auth/auth_view_model.dart';
import 'package:presence_kita/screen/auth/register_student_page.dart';
import 'package:presence_kita/screen/drawer/sus_view_model.dart';
import 'package:presence_kita/screen/komti/add_session_page.dart';
import 'package:presence_kita/screen/auth/signIn_student_page.dart';
import 'package:presence_kita/screen/drawer/change_password_page.dart';
import 'package:presence_kita/screen/drawer/permit_page.dart';
import 'package:presence_kita/screen/drawer/questionnaire_page.dart';
import 'package:presence_kita/screen/student/home/home_page.dart';
import 'package:presence_kita/screen/student/home/home_pratikum_page.dart';
import 'package:presence_kita/screen/student/home/home_view_model.dart';
import 'package:presence_kita/screen/student/presence/license_page.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/license_pratikum_page.dart';
import 'package:presence_kita/screen/student/presence/presence_page.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/presence_pratikum_page.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/presence_pratikum_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/screen/student/session/session_page.dart';
import 'package:presence_kita/screen/student/session/session_view_model.dart';
import 'package:presence_kita/screen/student/presence/sick_page.dart';
import 'package:presence_kita/screen/splash_page.dart';
import 'package:presence_kita/screen/student/session_pratikum/session_pratikum_page.dart';
import 'package:presence_kita/screen/student/session_pratikum/session_pratikum_view_model.dart';
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
      ChangeNotifierProvider<SessionPratikumViewModel>(
        create: (context) => SessionPratikumViewModel(),
      ),
      ChangeNotifierProvider<SusViewModel>(
        create: (context) => SusViewModel(),
      ),
      ChangeNotifierProvider<PresenceViewModel>(
        create: (context) => PresenceViewModel(),
      ),
      ChangeNotifierProvider<PresencePratikumViewModel>(
        create: (context) => PresencePratikumViewModel(),
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
        '/registerStudentPage': (context) => RegisterStudentPage(),
        '/homePage': (context) => const HomePage(),
        '/homePratikumPage': (context) => const HomePratikumPage(),
        '/permitPage': (context) => const PermitPage(),
        '/question': (context) => const QuestionnairePage(),
        '/sessionPage': (context) => const SessionPage(),
        '/sessionPratikumPage': (context) => const SessionPratikumPage(),
        '/presencePage': (context) => const PresencePage(),
        '/presencePratikumPage': (context) => const PresencePratikumPage(),
        '/licensePage': (context) => const LicenseePage(),
        '/licensePratikumPage': (context) => const LicenseePratikumPage(),
        '/sickPage': (context) => const SickPage(),
      },
    );
  }
}
