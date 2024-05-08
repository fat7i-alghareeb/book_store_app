import 'package:book_app/Features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/text_styles.dart';
import 'featured_books_widget.dart';
import 'newest_books_widget.dart';
import 'recently_viewed_books_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Newest",
            style: Styles.textStyle24,
          ),
        ),
        NewestBooksWidget(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            "Recently Viewed",
            style: Styles.textStyle24,
          ),
        ),
        RecentlyViewedBooksWidget(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
