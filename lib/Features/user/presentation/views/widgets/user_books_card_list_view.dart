import 'package:flutter/material.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/shared/widgets/book_card.dart';

class UserBooksCardListView extends StatelessWidget {
  const UserBooksCardListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .25;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BookCard(
            height: height,
            book: books[index],
          );
        },
      ),
    );
  }
}
