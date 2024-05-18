import 'Core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/themes.dart';
import 'Core/domain/entities/book_entity.dart';
import 'Core/utils/router/app_router.dart';
import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(Constants.kFeaturedBox);
  await Hive.openBox<BookEntity>(Constants.kNewestBox);
  //Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      // home: const MainNavigator(),
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      //darkTheme: darkMode,
    );
  }
}
