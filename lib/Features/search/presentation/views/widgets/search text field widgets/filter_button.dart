import 'package:flutter/material.dart';

import '../sort by/sort_by_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBottomSheet(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: Icon(Icons.filter_list),
        ),
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
