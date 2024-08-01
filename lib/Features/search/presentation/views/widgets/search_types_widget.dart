import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';
import '../../../../../constants.dart';
import '../../manger/cubit/search_cubit.dart';

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
        color: isSelected ? context.accentColor() : Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            typeName,
            style: Styles.textStyle14.copyWith(
              color: isSelected ? context.primaryColor() : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
