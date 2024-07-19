import 'package:book_app/Features/home/data/models/book_model.dart';
import 'Core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/themes.dart';
import 'Core/utils/router/app_router.dart';
import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  setupServiceLocator();
  await Hive.openBox<BookModel>(Constants.kTrendingBox);
  await Hive.openBox<BookModel>(Constants.kNewestBox);
  await Hive.openBox<BookModel>(Constants.kRecentViewedBox);
  await Hive.openBox<BookModel>(Constants.kFavoriteBooksBox);
  await Hive.openBox<BookModel>(Constants.kSavedBookBox);
  await Hive.openBox<int>(Constants.kSavedTimeBox);
  //Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: 2 < 4 ? Color(0xffe6eff4) : Color(0xff1b2026),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      // home: const MainNavigator(),
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.light,
    );
  }
}
