import '../../data/repo/user_repo_imp.dart';
import '../manger/favorite%20box%20cubit/cubit/favorite_books_cubit.dart';
import '../manger/saved%20box%20cubit/cubit/saved_books_cubit.dart';
import 'widgets/user_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SavedBooksCubit(getIt<UserRepo>())..fetchSavedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteBooksCubit(getIt<UserRepo>())..fetchFavoriteBooks(),
        ),
      ],
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: UserBody(),
        ),
      ),
    );
  }
}
