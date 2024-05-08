import 'package:book_app/Core/shared/widgets/book_card.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book_entity.dart';

class BookCardListView extends StatelessWidget {
  const BookCardListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .25;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return BookCard(
            height: height,
            book: books[index],
          );
        },
      ),
    );
  }
}
