import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/book_entity.dart';
import '../router/router_paths.dart';

void navigateToDetails(BuildContext context, BookEntity book) {
  Navigator.pushNamed(
    context,
    KRouter.detailsScreen,
    arguments: book,
  );
  HapticFeedback.heavyImpact();
}
