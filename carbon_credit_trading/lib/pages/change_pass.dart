import 'package:carbon_credit_trading/services/user_service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_passwordfield.dart';
import 'package:flutter/material.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  createState() => _ChangePassPage();
}

class _ChangePassPage extends State<ChangePassPage> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordAgainController =
      TextEditingController();
  final UserService userService = UserService();
  String? errorMessage;

  void _changePass() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Thay đổi mật khẩu",
      ),
      body: Container(
        color: AppColors.greyBackGround,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: <Widget>[
            CustomPasswordField(
                controller: currentPasswordController,
                labelText: 'Nhập mật khẩu hiện tại'),
            const SizedBox(height: 15),
            CustomPasswordField(
                controller: newPasswordController,
                labelText: 'Nhập mật khẩu mới'),
            const SizedBox(height: 15),
            CustomPasswordField(
                controller: newPasswordAgainController,
                labelText: 'Nhập lại mật khẩu mới'),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: _changePass,
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenButton,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Lưu',
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
