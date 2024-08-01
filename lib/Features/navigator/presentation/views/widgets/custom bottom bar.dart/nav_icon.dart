import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

class NavigatorIcon extends StatelessWidget {
  final VoidCallback setChange;
  final bool changing;
  final IconData icon;
  const NavigatorIcon({
    super.key,
    required this.setChange,
    required this.changing,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: setChange,
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Icon(
              icon,
              color: changing
                  ? context.accentColor()
                  : context.accentColor().withOpacity(0.1),
              size: changing ? 40 : 30,
            ),
          ),
        ),
      ),
    );
  }
}
