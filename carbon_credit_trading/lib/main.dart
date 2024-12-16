import 'package:carbon_credit_trading/pages/intermediary_question_page.dart';
import 'package:carbon_credit_trading/pages/login_page.dart';
import 'package:carbon_credit_trading/pages/pending_account_page.dart';
import 'package:carbon_credit_trading/pages/profile_page.dart';
import 'package:carbon_credit_trading/pages/question_page.dart';
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
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }), //navigation transition
        useMaterial3: true, // should be changed
      ),
      home: IntermediaryQuestionPage(),
    );
  }
}
