import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.labelText,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
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
