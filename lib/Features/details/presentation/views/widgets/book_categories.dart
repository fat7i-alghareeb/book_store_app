import '../../../../../Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';
import '../../../../../constants.dart';

class BookCategoriesWidget extends StatelessWidget {
  const BookCategoriesWidget({super.key, required this.subjects});
  final List<String> subjects;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => CategoryContainerWidget(
          categoryName: subjects[index],
        ),
      ),
    );
  }
}

class CategoryContainerWidget extends StatelessWidget {
  const CategoryContainerWidget({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Constants.kBorderRadius,
          ),
          color: context.accentColor().withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              categoryName,
              style: Styles.textStyle14.copyWith(
                color: context.accentColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
