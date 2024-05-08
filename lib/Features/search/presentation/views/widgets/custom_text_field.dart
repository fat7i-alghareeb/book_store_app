import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';

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
        controller: _searchController,
        focusNode: searchFocusNode,
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Books, Authors, or ISBN',
          hintStyle: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
