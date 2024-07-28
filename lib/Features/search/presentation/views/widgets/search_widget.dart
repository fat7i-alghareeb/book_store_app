import 'package:flutter/material.dart';

import 'search text field widgets/search_text_field.dart';

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
            child: SearchTextField(
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
