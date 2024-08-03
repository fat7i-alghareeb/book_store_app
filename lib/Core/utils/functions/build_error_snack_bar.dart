import '../helper_extensions.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorWidget(String errMessage, BuildContext context) {
  return SnackBar(
    backgroundColor: context.accentColor(),
    content: Text(
      errMessage,
      style: const TextStyle(),
    ),
    duration: const Duration(seconds: 3),
  );
}
