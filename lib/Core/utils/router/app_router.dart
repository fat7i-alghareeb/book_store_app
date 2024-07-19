import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Features/home/presentation/manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import 'package:flutter/material.dart';
import '../../../Features/navigator/presentation/views/navigator.dart';
import '../functions/setup_service_locator.dart';
import 'router_paths.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KRouter.mainNavigator:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RecentViewedBooksCubit(getIt<HomeRepo>()),
            child: const MainNavigator(),
          ),
        );
      // case KRouter.detailsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       final BookModel book = settings.arguments as BookModel;
      //       return BlocProvider(
      //         create: (context) => AddBooksCubit(),
      //         child: DetailsScreen(book: book),
      //       );
      //     },
      // );
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
