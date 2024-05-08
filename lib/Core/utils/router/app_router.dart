import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../Features/details/presentation/views/details_screen.dart';
import '../../../Features/navigator/presentation/views/navigator.dart';
import 'router_paths.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KRouter.mainNavigator:
        return MaterialPageRoute(
          builder: (_) => const MainNavigator(),
        );
      case KRouter.detailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final BookEntity book = settings.arguments as BookEntity;
            return DetailsScreen(book: book);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
