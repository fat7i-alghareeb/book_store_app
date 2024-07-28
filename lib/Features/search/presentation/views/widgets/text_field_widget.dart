import 'package:book_app/Core/utils/text_styles.dart';
import 'package:book_app/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'filter_button.dart';
import 'search_button.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.searchFocusNode,
      required this.searchController});
  final FocusNode searchFocusNode;
  final TextEditingController searchController;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
          GestureDetector(
              onTap: () => showBottomSheet(context),
              child: const FilterButton()),
        ],
      ),
    );
  }

//todo make the borders rounded
  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return const SortByBottomSheetBody();
      },
    );
  }
}

class SortByBottomSheetBody extends StatefulWidget {
  const SortByBottomSheetBody({
    super.key,
  });

  @override
  State<SortByBottomSheetBody> createState() => _SortByBottomSheetBodyState();
}

class _SortByBottomSheetBodyState extends State<SortByBottomSheetBody> {
  void _changeSortByType(int index) {
    setState(
      () {
        SearchConstants.sortTypesIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Sort By",
          style: Styles.textStyle24,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.clear_rounded,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: SearchConstants.sortTypes.length,
        itemBuilder: (context, index) => SortByTypeWidget(
          label: SearchConstants.sortTypes[index],
          isActive: SearchConstants.sortTypesIndex == index,
          onTap: () => _changeSortByType(index),
        ),
      ),
    );
  }
}

class SortByTypeWidget extends StatelessWidget {
  const SortByTypeWidget({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(
              label,
              style: Styles.textStyle24.copyWith(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
