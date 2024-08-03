import 'Core/shared/cubit/user_info_cubit.dart';
import 'Core/shared/cubit/user_info_state.dart';
import 'Core/utils/helper_extensions.dart';
import 'Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/shared/models/user.dart';
import 'Core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/themes.dart';
import 'Core/utils/router/app_router.dart';
import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(UserAdapter());

  setupServiceLocator();
  await Hive.openBox<BookModel>(Constants.kTrendingBox);
  await Hive.openBox<BookModel>(Constants.kNewestBox);
  await Hive.openBox<BookModel>(Constants.kRecentViewedBox);
  await Hive.openBox<BookModel>(Constants.kFavoriteBooksBox);
  await Hive.openBox<BookModel>(Constants.kSavedBookBox);
  await Hive.openBox<int>(Constants.kSavedTimeBox);
  await Hive.openBox<User>(Constants.kUserBox);

  //Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (context) => UserInfoCubit()..saveUser(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    bool userSelectedTheme = context.getCubit<UserInfoCubit>().userTheme;
    return BlocListener<UserInfoCubit, UserInfoState>(
      listener: (context, state) {
        if (state is EditThemeUserInfo) {
          userSelectedTheme =
              !BlocProvider.of<UserInfoCubit>(context).userTheme;
          setState(() {});
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Store',
        // home: const MainNavigator(),
        onGenerateRoute: _appRouter.generateRoute,
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: userSelectedTheme ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }
}
