import 'package:carbon_credit_trading/pages/business_options_page.dart';
import 'package:carbon_credit_trading/pages/buyer.dart';
import 'package:carbon_credit_trading/pages/forgetpass_page.dart';
import 'package:carbon_credit_trading/pages/intermediary_page.dart';
import 'package:carbon_credit_trading/pages/login.dart';
import 'package:carbon_credit_trading/pages/seller.dart';
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
        useMaterial3: true,
      ),
      initialRoute: '/seller',
      routes: {
        '/login': (context) => const LoginPage(),
        '/business_options': (context) => const BusinessOptionsPage(),
        '/intermediary': (context) => const IntermediaryPage(),
        '/forgetpass': (context) => const ForgetPassPage(),
        '/signup': (context) => const SignUpPage(),
        '/buyer': (context) => const BuyerPage(),
        '/seller': (context) => const SellerPage(),
      },
    );
  }
}
