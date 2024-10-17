import 'package:carbon_credit_trading/pages/business_options_page.dart';
import 'package:carbon_credit_trading/pages/buyer_page.dart';
import 'package:carbon_credit_trading/pages/change_pass.dart';
import 'package:carbon_credit_trading/pages/change_profile.dart';
import 'package:carbon_credit_trading/pages/contact_page.dart';

import 'package:carbon_credit_trading/pages/forgetpass_page.dart';
import 'package:carbon_credit_trading/pages/intermediary_page.dart';
import 'package:carbon_credit_trading/pages/login_page.dart';
import 'package:carbon_credit_trading/pages/profile_page.dart';
import 'package:carbon_credit_trading/pages/project_registration_page.dart';
import 'package:carbon_credit_trading/pages/seller_page.dart';

import 'package:carbon_credit_trading/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Credit Trading',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true, // should be changed
      ),
      initialRoute: '/register_project',
      routes: {
        '/login': (context) => const LoginPage(),
        '/business_options': (context) => const BusinessOptionsPage(),
        '/intermediary': (context) => const IntermediaryPage(),
        '/forgetpass': (context) => const ForgetPassPage(),
        '/signup': (context) => const SignUpPage(),
        '/buyer': (context) => const BuyerPage(),
        '/seller': (context) => const SellerPage(),
        '/profile': (context) => const ProfilePage(),
        '/change_profile': (context) => const ChangeProfilePage(),
        '/change_pass': (context) => const ChangePassPage(),
        '/register_project': (context) => const ProjectRegistrationPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
