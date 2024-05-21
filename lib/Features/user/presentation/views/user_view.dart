import '../../../../Core/shared/widgets/book_card_list_view.dart';
import '../../../../Core/shared/widgets/books_list_view.dart';
import '../../../../Core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_info.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ProfileInfo(),
            ),
            Divider(
              indent: width * .15,
              endIndent: width * .15,
              color: Theme.of(context).colorScheme.secondary,
              // endIndent: width * .85,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Your Saved Books (21)",
                style: Styles.textStyle24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BookCardListView(
                books: [],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Your Favorite Books (7)",
                style: Styles.textStyle24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BooksListViewWidget(
                books: [],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
