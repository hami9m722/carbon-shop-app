import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final Color color;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.color = Colors.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: AppBar(
        forceMaterialTransparency: true, // not tined color
        title: Text(title),
        titleTextStyle: AppTextStyles.heading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow from AppBar itself
      ),
    );
  }
}
