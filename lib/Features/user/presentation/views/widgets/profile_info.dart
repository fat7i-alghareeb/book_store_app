import '../../../../../Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';
import 'indicator_books_widget.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.savedBooksNumber,
    required this.favoriteBooksNumber,
  });
  final int savedBooksNumber;
  final int favoriteBooksNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fat7i Al3'areeb",
              style: Styles.textStyle24,
            ),
            Row(
              children: [
                IndicatorBooksWidget(
                  indicatorTypeName: "Saved",
                  count: savedBooksNumber.toString(),
                ),
                IndicatorBooksWidget(
                  indicatorTypeName: "Fav",
                  count: favoriteBooksNumber.toString(),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/user.png",
              height: 90,
              width: 90,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.accentColor().withOpacity(0.7),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Edit Profile",
                style: Styles.textStyle14.copyWith(
                  color: context.primaryColor(),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
