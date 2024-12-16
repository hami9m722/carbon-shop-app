import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/pages/login_page.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_passwordfield.dart';
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
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController taxIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController businessSectorController =
      TextEditingController();
  final TextEditingController representativeController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? errorMessage;

  void _signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String password = passwordController.text.trim();
    String passwordAgain = passwordAgainController.text.trim();

    if (password != passwordAgain) {
      setState(() {
        errorMessage = "Mật khẩu không trùng khớp";
      });
    } else {
      try {
        await registrationResourceApi.register(UserRegistrationRequest(
          name: 'Dai dien ${companyNameController.text.trim()}',
          email: emailController.text.trim(),
          password: password,
          phone: phoneNumberController.text.trim(),
          companyName: companyNameController.text.trim(),
          companyEmail: emailController.text.trim(),
          companyAddress: addressController.text.trim(),
          companyIndustry: businessSectorController.text.trim(),
          companyPhone: phoneNumberController.text.trim(),
          companyTaxCode: taxIdController.text.trim(),
        ));

        // Xóa lỗi nếu thành công
        setState(() {
          errorMessage = null;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } catch (e) {
        // Hiển thị thông báo lỗi nếu xảy ra lỗi
        setState(() {
          errorMessage = "Đã xảy ra lỗi khi đăng ký: $e";
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    companyNameController.dispose();
    taxIdController.dispose();
    addressController.dispose();
    representativeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
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
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),

                        TextFormField(
                          controller: companyNameController,
                          decoration: const InputDecoration(
                            labelText: 'Tên doanh nghiệp',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              Validators.validateRequiredField(
                                  value, 'Tên doanh nghiệp'),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) =>
                                Validators.validateEmail(value)),
                        const SizedBox(height: 15),
                        CustomPasswordField(controller: passwordController),
                        const SizedBox(height: 15),
                        CustomPasswordField(
                            controller: passwordAgainController,
                            labelText: 'Nhập lại mật khẩu'),
                        const SizedBox(height: 15),
                        TextFormField(
                            controller: taxIdController,
                            decoration: const InputDecoration(
                              labelText: 'Mã số thuế',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                Validators.validateTaxId(value)),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            labelText: 'Địa chỉ',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              Validators.validateRequiredField(
                                  value, 'Địa chỉ'),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: businessSectorController,
                          decoration: const InputDecoration(
                            labelText: 'Ngành nghề kinh doanh',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              Validators.validateRequiredField(
                                  value, 'Ngành nghề kinh doanh'),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Thông tin người đại diện",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: representativeController,
                          decoration: const InputDecoration(
                            labelText: 'Người đại diện',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              Validators.validateRequiredField(
                                  value, 'Người đại diện'),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                            controller: phoneNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Số điện thoại',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                Validators.validatePhone(value)),

                        const SizedBox(height: 15),
                        if (errorMessage != null)
                          Container(
                            width: double
                                .infinity, // Ensure container width equal to window's width
                            alignment: Alignment.center,
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ))),
          ),
        ));
  }
}
