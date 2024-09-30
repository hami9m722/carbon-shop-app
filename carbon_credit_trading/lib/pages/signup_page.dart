import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custome_appbar.dart';
import 'package:carbon_credit_trading/theme/custome_emailfield.dart';
import 'package:carbon_credit_trading/theme/custome_passwordfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  String? errorMessage;

  void _signUp() async {
    String password = passwordController.text.trim();
    String passwordAgain = passwordAgainController.text.trim();

    if (password != passwordAgain) {
      setState(() {
        errorMessage = "Mật khẩu không trùng khớp";
      });
    } else {
      setState(() {
        errorMessage = null;
      });
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Đăng ký",
        ),
        body: SafeArea(
            child: Container(
          color: AppColors.greyBackGround,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                // Custom Email Field
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Tên doanh nghiệp',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                // Custom Email Field
                CustomEmailField(controller: emailController),
                const SizedBox(height: 15),
                // Custom Password Field
                CustomPasswordField(controller: passwordController),
                const SizedBox(height: 15),
                CustomPasswordField(
                    controller: passwordAgainController,
                    labelText: 'Nhập lại mật khẩu'),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Mã số thuế", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Địa chỉ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Ngành nghề kinh doanh',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Thông tin người đại diện",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Người đại diện',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                if (errorMessage != null)
                  Container(
                    width: double
                        .infinity, // Đảm bảo container rộng bằng toàn bộ chiều rộng màn hình
                    alignment: Alignment.center, // Căn giữa nội dung bên trong
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center, // Căn giữa văn bản
                    ),
                  ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Đã có tài khoản đăng nhập?',
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
                    onPressed: _signUp,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )));
  }
}
