import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';
import 'indicator_books_widget.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fat7i Al3'areeb",
              style: Styles.textStyle24,
            ),
            Row(
              children: [
                IndicatorBooksWidget(
                  indicatorTypeName: "Saved",
                  count: "21",
                ),
                IndicatorBooksWidget(
                  indicatorTypeName: "Fav",
                  count: "7",
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
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Edit Profile",
                style: Styles.textStyle14.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
