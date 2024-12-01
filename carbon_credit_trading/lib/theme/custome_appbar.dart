import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: AppBar(
        title: Text(title),
        titleTextStyle: AppTextStyles.heading,
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow from AppBar itself
      ),
    );
  }
}
