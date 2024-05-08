import 'package:flutter/material.dart';

import '../../../../../Core/shared/widgets/books_list_view.dart';

class RecentlyViewedBooksWidget extends StatelessWidget {
  const RecentlyViewedBooksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: BooksListViewWidget(),
    );
  }
}
