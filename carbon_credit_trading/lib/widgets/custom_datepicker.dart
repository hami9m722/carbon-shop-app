import 'package:flutter/material.dart';

class CustomDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(BuildContext) onTap;

  const CustomDatePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
