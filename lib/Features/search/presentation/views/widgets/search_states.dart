import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/cubit/search_cubit.dart';
import '../../manger/cubit/search_state.dart';
import 'search_success.dart';

class SearchStates extends StatelessWidget {
  const SearchStates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchSuccessWidget(
            searchResponse: state.searchResponse,
          );
        } else if (state is SearchFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else if (state is SearchLoading) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: Image.asset(
                "images/search.png",
                height: 140,
              ),
            ),
          );
        }
      },
    );
  }
}
