import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

//send change pass via emailemail

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  createState() => _ForgetPassPage();
}

class _ForgetPassPage extends State<ForgetPassPage> {
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  void _send() async {
    await passwordResetResourceApi
        .start(PasswordResetRequest(email: emailController.text.trim()));
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
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => Validators.validateEmail(value)),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: _send,
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
