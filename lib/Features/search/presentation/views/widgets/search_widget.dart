import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'filter_button.dart';
import 'search_button.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key, required this.searchFocusNode});
  final FocusNode searchFocusNode;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      widget.searchFocusNode.hasFocus
          ? widget.searchFocusNode.requestFocus()
          : null;
      if (searchText.isNotEmpty) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.searchFocusNode.hasFocus
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
        ),
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const SearchButton(),
          Expanded(
            child: CustomTextField(
              searchController: _searchController,
              searchFocusNode: widget.searchFocusNode,
            ),
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}
