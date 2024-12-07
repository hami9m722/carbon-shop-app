import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_emailfield.dart';
import 'package:flutter/material.dart';

class ChangeProfilePage extends StatefulWidget {
  const ChangeProfilePage({super.key});
  @override
  createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  final TextEditingController companyNameController =
      TextEditingController(text: "companyName");
  String? errorMessage;
  void _changProfile() async {
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
      //actions when change profile successfully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Container(
          color: AppColors.greyBackGround,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Thay đổi thông tin doanh nghiệp",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                // Custom Email Field
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Tên doanh nghiệp',
                    border: OutlineInputBorder(),
                  ),
                  controller: companyNameController,
                ),
                const SizedBox(height: 15),
                // Custom Email Field
                CustomEmailField(controller: emailController),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Mã số thuế", border: OutlineInputBorder()),
                ),
                // Custom Password Field
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
                const SizedBox(height: 25),
                const Text(
                  "Thông tin người đại diện",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
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
                        .infinity, // ensure container width equal to window's width
                    alignment: Alignment.center,
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 10),
                // Đăng nhập Button
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: _changProfile,
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
        )));
  }
}
