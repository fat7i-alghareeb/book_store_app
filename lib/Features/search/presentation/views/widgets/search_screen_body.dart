import 'package:flutter/material.dart';

import '../../../../../Core/shared/widgets/sliver_sized_box.dart';
import 'search_states.dart';
import 'search_types_widget.dart';
import 'search_widget.dart';

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
