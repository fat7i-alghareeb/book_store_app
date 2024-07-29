import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'filter_button.dart';
import 'search_button.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.searchFocusNode,
    required this.searchController,
  });
  final FocusNode searchFocusNode;
  final TextEditingController searchController;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.searchFocusNode.hasFocus
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
        ),
        color: Theme.of(context).colorScheme.secondary.withOpacity(.05),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const SearchButton(),
          Expanded(
            child: CustomTextField(
              searchController: widget.searchController,
              searchFocusNode: widget.searchFocusNode,
            ),
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}
