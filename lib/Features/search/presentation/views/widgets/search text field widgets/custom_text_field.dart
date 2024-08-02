import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController searchController,
    required this.searchFocusNode,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            context.getCubit<SearchCubit>().fetchBooks(searchText: value);
          }
        },
        controller: _searchController,
        focusNode: searchFocusNode,
        textInputAction: TextInputAction.search,
        cursorColor: context.accentColor(),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Books, Authors',
          hintStyle: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
