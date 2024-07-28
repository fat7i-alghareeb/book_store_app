import 'package:book_app/Core/shared/widgets/sliver_sized_box.dart';
import 'package:book_app/Core/utils/functions/setup_service_locator.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/text_styles.dart';
import '../../../../constants.dart';
import '../../../../Core/shared/widgets/book_card.dart';
import 'widgets/text_field_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverSizedBox(
            height: 20,
          ),
          const SearchWidget(),
          const SliverSizedBox(
            height: 20,
          ),
          const SliverToBoxAdapter(
            child: SearchTypes(),
          ),
          const SliverSizedBox(
            height: 18,
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return SliverList.builder(
                  itemCount: (state.searchResponse.books!.length + 1),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.searchResponse.numFound} Results Found",
                            style: Styles.textStyle14,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    }
                    return BookCard(
                      height: MediaQuery.of(context).size.height * .24,
                      book: state.searchResponse.books![index - 1],
                      containerWidth: MediaQuery.of(context).size.width - 40,
                    );
                  },
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
          )
        ],
      ),
    );
  }
}

class SearchTypes extends StatefulWidget {
  const SearchTypes({
    super.key,
  });

  @override
  State<SearchTypes> createState() => _SearchTypesState();
}

class _SearchTypesState extends State<SearchTypes> {
  void _changeType(int index) {
    setState(
      () {
        SearchConstants.searchTypeIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: SearchConstants.searchTypes.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _changeType(index),
          child: SearchTypeWidget(
            typeName: SearchConstants.searchTypes[index],
            isSelected: SearchConstants.searchTypeIndex == index,
          ),
        ),
      ),
    );
  }
}

class SearchTypeWidget extends StatelessWidget {
  const SearchTypeWidget({
    super.key,
    required this.typeName,
    required this.isSelected,
  });
  final String typeName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Constants.kBorderRadius,
        ),
        color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            typeName,
            style: Styles.textStyle14.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _textEditingController.removeListener(_onSearchChanged);

    _textEditingController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _textEditingController.text.length == 1 ||
            _textEditingController.text.isEmpty
        ? setState(() {})
        : null;
  }

  Widget _cancelWidget() {
    return _textEditingController.text.isEmpty
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => _textEditingController.clear(),
            child: const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Center(
                child: Text("Cancel"),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              searchFocusNode: _searchFocusNode,
              searchController: _textEditingController,
            ),
          ),
          _cancelWidget()
        ],
      ),
    );
  }
}
