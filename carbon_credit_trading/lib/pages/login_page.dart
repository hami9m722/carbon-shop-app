import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/pages/forgetpass_page.dart';
import 'package:carbon_credit_trading/pages/intermediary_page.dart';
import 'package:carbon_credit_trading/pages/signup_page.dart';
import 'package:carbon_credit_trading/pages/user_page.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_passwordfield.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      var authResp = await authService.authenticate(email, password);
      var user = authResp.user;

      if (!mounted) return;

      if (user != null) {
        if (user.role == AppUserDTORoleEnum.SELLER_OR_BUYER) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ),
          );
        } else {
          businessOption = BusinessOption.mediator;
          Navigator.pushReplacement(
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
    } catch (e) {
      print("Error during authentication: $e");

      if (e.toString().contains("401")) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email hoặc mật khẩu không đúng"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Đã xảy ra lỗi: ${e.toString()}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false, child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Đăng nhập",
      ),
      body: Container(
          color: AppColors.greyBackGround,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateEmail(value)),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Nếu chưa có tài khoản, vui lòng đăng ký!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
