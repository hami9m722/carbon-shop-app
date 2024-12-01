import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final bool obscureText; // Đặt mặc định là false
  final String? labelText; // Thuộc tính cho title

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.decoration,
    this.obscureText = false, // Giá trị mặc định
    this.labelText, // Khởi tạo labelText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      decoration: decoration ??
          InputDecoration(
            labelText: labelText, // Sử dụng labelText ở đây
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenButton, width: 2.0),
            ),
          ),
    );
  }
}
