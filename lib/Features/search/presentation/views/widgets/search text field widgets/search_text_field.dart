import '../../../../../../Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'filter_button.dart';
import 'search_button.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchFocusNode,
    required this.searchController,
  });
  final FocusNode searchFocusNode;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: searchFocusNode.hasFocus
              ? context.accentColor()
              : Colors.transparent,
        ),
        color: context.accentColor().withOpacity(.05),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const SearchButton(),
          Expanded(
            child: CustomTextField(
              searchController: searchController,
              searchFocusNode: searchFocusNode,
            ),
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}
