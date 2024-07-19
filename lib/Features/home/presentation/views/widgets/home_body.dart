import 'custom_home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/text_styles.dart';
import 'trending books widgets/trending_books_widget.dart';
import 'newest books widgets/newest_books_widget.dart';
import 'recently_viewed_books_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.controller,
  });
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        TrendingBooksWidget(
          controller: controller,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Newest",
            style: Styles.textStyle24,
          ),
        ),
        const NewestBooksWidget(),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            "Recently Viewed",
            style: Styles.textStyle24,
          ),
        ),
        const RecentlyViewedBooksWidget(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
