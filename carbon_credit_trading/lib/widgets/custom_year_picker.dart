import 'package:flutter/material.dart';

class CustomYearPicker extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final String labelText;
  final int startYear;
  final int endYear;
  final ValueChanged<String>? onChanged;

  const CustomYearPicker({
    super.key,
    required this.controller,
    required this.labelText,
    required this.startYear,
    required this.endYear,
    this.decoration,
    this.keyboardType,
    this.onChanged,
  });

  Future<void> _selectYear(BuildContext context) async {
    int selectedYear = controller.text.isNotEmpty
        ? int.tryParse(controller.text) ?? DateTime.now().year
        : DateTime.now().year;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn năm'),
          content: SizedBox(
            height: 200,
            width: 100,
            child: YearPicker(
              firstDate: DateTime(startYear),
              lastDate: DateTime(endYear),
              selectedDate: DateTime(selectedYear),
              onChanged: (DateTime dateTime) {
                selectedYear = dateTime.year;
                controller.text = "$selectedYear";
                if (onChanged != null) {
                  onChanged!(
                      "$selectedYear"); // Passing the selected year as a String
                }
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectYear(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: decoration ??
              InputDecoration(
                labelText: labelText,
                border: const OutlineInputBorder(),
              ),
        ),
      ),
    );
  }
}
