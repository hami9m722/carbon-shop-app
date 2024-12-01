import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/custome_textformfield.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true; // Trạng thái ẩn hiện mật khẩu

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      validator: (value) {
        return Validators.validatePassword(value);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Mật khẩu',
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText; // Toggle password visibility
            });
          },
        ),
      ),
    );
  }
}
