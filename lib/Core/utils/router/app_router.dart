import 'package:book_app/Features/details/presentation/manger/cubit/add_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/book_entity.dart';
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
            return BlocProvider(
              create: (context) => AddBooksCubit(),
              child: DetailsScreen(book: book),
            );
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
