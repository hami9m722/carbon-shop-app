import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/pages/business_options_page.dart';
import 'package:carbon_credit_trading/pages/forgetpass_page.dart';
import 'package:carbon_credit_trading/pages/intermediary_page.dart';
import 'package:carbon_credit_trading/services/user_service.dart'; // Đảm bảo đường dẫn đúng
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:carbon_credit_trading/theme/custom_emailfield.dart';
import 'package:carbon_credit_trading/theme/custom_passwordfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserService userService = UserService();
  String? errorMessage;

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user = await userService.checkUser(email, password);

    if (!mounted) return;

    // validate fields empty

    if (user != null) {
      if (user.type == 'doanh_nghiep') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BusinessOptionsPage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IntermediaryPage(),
          ),
        );
      }
    } else {
      setState(() {
        errorMessage = 'Email hoặc mật khẩu không đúng';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Đăng nhập",
      ),
      body: Container(
        color: AppColors.greyBackGround,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            // Custom Email Field
            CustomEmailField(controller: emailController),
            const SizedBox(height: 15),
            // Custom Password Field
            CustomPasswordField(controller: passwordController),
            const SizedBox(height: 10),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPassPage(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Quên mật khẩu?',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(width: 7),
                    Icon(Icons.arrow_forward, color: Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Đăng nhập Button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: _login,
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenButton,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, '/signup' as Route<Object?>);
                },
                child: const Text(
                  'Nếu chưa có tài khoản, vui lòng đăng ký!',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
