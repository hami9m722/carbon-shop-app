import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final bool obscureText;
  final String? labelText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.decoration,
    this.obscureText = false,
    this.labelText,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenButton, width: 2.0),
            ),
          ),
    );
  }
}
