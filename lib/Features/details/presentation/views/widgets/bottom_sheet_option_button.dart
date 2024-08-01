import "package:book_app/Core/utils/helper_extensions.dart";
import "package:flutter/material.dart";
import "../../../../../Core/utils/text_styles.dart";

class BottomSheetOptionButton extends StatelessWidget {
  const BottomSheetOptionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Styles.textStyle24.copyWith(
                  color: isActive ? context.primaryColor() : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(
                icon,
                color: isActive ? context.primaryColor() : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
