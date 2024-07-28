import 'package:flutter/material.dart';

import '../../../../../../Core/utils/text_styles.dart';
import '../../../manger/cubit/search_cubit.dart';
import 'sort_by_button.dart';

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
        itemBuilder: (context, index) => SortByButton(
          label: SearchConstants.sortTypes[index],
          isActive: SearchConstants.sortTypesIndex == index,
          onTap: () => _changeSortByType(index),
        ),
      ),
    );
  }
}
