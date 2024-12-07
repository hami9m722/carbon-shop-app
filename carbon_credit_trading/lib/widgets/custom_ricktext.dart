import 'package:flutter/material.dart';

Widget customRichText({
  required String title,
  required String value,
  Color? valueColor,
  FontWeight? valueWeight,
  double spacing = 4.0,
}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 21,
          ),
        ),
        WidgetSpan(
          child: SizedBox(width: spacing),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: valueColor ?? Colors.black,
            fontWeight: valueWeight ?? FontWeight.normal,
            fontSize: 21,
          ),
        ),
      ],
    ),
  );
}
