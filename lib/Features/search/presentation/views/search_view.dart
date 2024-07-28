import 'package:book_app/Core/utils/functions/setup_service_locator.dart';
import 'package:book_app/Features/search/data/repo/search_repo.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_screen_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(getIt<SearchRepo>()),
          child: const SearchScreenBody(),
        ),
      ),
    );
  }
}
