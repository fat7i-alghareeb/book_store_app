import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../router/router_paths.dart';

void navigateToDetails(
    BuildContext context, BookModel book, void Function() onPop) {
  Navigator.pushNamed(
    context,
    KRouter.detailsScreen,
    arguments: book,
  ).whenComplete(onPop);
  HapticFeedback.heavyImpact();
}
