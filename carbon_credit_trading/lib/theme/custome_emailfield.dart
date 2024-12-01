import 'package:carbon_credit_trading/theme/custome_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController? controller;

  const CustomEmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      controller: controller,
      validator: (value) {
        return Validators.validateEmail(value);
      },
    );
  }
}
