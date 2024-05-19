import 'package:flutter/material.dart';

SnackBar buildErrorWidget(String errMessage, BuildContext context) {
  return SnackBar(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    content: Text(
      errMessage,
      style: const TextStyle(),
    ),
    duration: const Duration(seconds: 3),
  );
}
