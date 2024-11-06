import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onToggle;

  const SelectableItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.greenButton : Colors.grey,
              ),
              // Loại bỏ borderRadius để không có góc bo tròn
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.greenButton : Colors.black,
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              top: 0,
              left: 0,
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: AppColors.greenButton,
                  width: 20,
                  height: 20,
                  alignment: Alignment.topLeft,
                  child: const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
