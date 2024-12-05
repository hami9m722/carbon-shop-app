import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/custom_textformfield.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText;

  const CustomPasswordField({
    super.key,
    this.controller,
    this.validator,
    this.labelText = 'Mật khẩu',
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      validator: (value) {
        return Validators.validatePassword(value);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      obscureText: obscureText,
    );
  }
}
