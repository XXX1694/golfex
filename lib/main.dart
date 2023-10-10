import 'package:flutter/material.dart';
import 'package:goflex/features/about/presentation/pages/about_page.dart';
import 'package:goflex/features/agreement_page/presentation/pages/agreement_page.dart';
import 'package:goflex/features/choose_role/presentation/pages/choose_role.dart';
import 'package:goflex/features/help/presentation/pages/help_page.dart';
import 'package:goflex/features/login/presentation/pages/login_page.dart';
import 'package:goflex/features/main_page/presentation/pages/main_pagge.dart';
import 'package:goflex/features/notification/presentation/pages/notification_page.dart';
import 'package:goflex/features/registration/presentation/pages/organization_registration_page.dart';
import 'package:goflex/features/registration/presentation/pages/person_registration_page.dart';
import 'package:goflex/features/settings/presentation/pages/settings_page.dart';
import 'package:goflex/features/welcome_page/presentation/pages/welcome_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/choose_role': (context) => const ChooseRole(),
        '/registration/person': (context) => const PersonrRegistrationPage(),
        '/registration/organization': (context) =>
            const OrganizationRegistrationPage(),
        '/agreement': (context) => const AgreementPage(),
        '/main': (context) => const MainPage(),
        '/settings': (context) => const SettingsPage(),
        '/about': (context) => const AboutPage(),
        '/help': (context) => const HelpPage(),
        '/notification': (context) => const NotificationPage()
      },
      initialRoute: '/main',
    );
  }
}
