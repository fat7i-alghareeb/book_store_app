import 'package:book_app/Core/shared/widgets/sliver_sized_box.dart';
import 'package:book_app/Core/utils/functions/setup_service_locator.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/search_states.dart';
import 'widgets/search_types_widget.dart';
import 'widgets/search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<SearchCubit>(),
          child: const SearchScreenBody(),
        ),
      ),
    );
  }
}

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomScrollView(
        slivers: [
          SliverSizedBox(height: 20),
          SearchWidget(),
          SliverSizedBox(height: 20),
          SliverToBoxAdapter(child: SearchTypes()),
          SliverSizedBox(height: 18),
          SearchStates()
        ],
      ),
    );
  }
}
