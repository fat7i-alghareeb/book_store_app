import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.widget,
    required this.onPressed,
    this.color,
  });
  final Widget widget;
  final void Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      color: color ?? context.onPrimaryColor(),
      elevation: 0,
      child: IconButton(
        onPressed: onPressed,
        icon: widget,
      ),
    );
  }
}
