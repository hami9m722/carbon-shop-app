import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/services/user_service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:carbon_credit_trading/theme/custom_emailfield.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  createState() => _ForgetPassPage();
}

class _ForgetPassPage extends State<ForgetPassPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserService userService = UserService();
  String? errorMessage;

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user = await userService.checkUser(email, password);

    if (!mounted) return; // Kiểm tra xem widget có còn mounted không

    if (user != null) {
      // Kiểm tra loại người dùng và điều hướng
      if (user.type == 'doanh_nghiep') {
        Navigator.pushNamed(context, '/business_options');
      } else {
        Navigator.pushNamed(context, '/intermediary');
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
      appBar: const CustomAppBar(
        title: "Quên mật khẩu",
      ),
      body: Container(
        color: AppColors.greyBackGround,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: <Widget>[
            const Text(
                "Vui lòng nhập địa chỉ email của bạn. Bạn sẽ nhận được một liên kết để tạo mật khẩu mới qua email.",
                textAlign: TextAlign.justify),
            const SizedBox(height: 15),
            CustomEmailField(controller: emailController),
            const SizedBox(height: 40),
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
                  'Gửi',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
