import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/book_entity.dart';
import '../router/router_paths.dart';

void navigateToDetails(
    BuildContext context, BookEntity book, void Function() onPop) {
  Navigator.pushNamed(
    context,
    KRouter.detailsScreen,
    arguments: book,
  ).whenComplete(onPop);
  HapticFeedback.heavyImpact();
}
