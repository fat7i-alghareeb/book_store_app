import 'package:book_app/Core/utils/functions/details_navigator.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book_entity.dart';
import 'custom_book_image.dart';

class BooksListViewWidget extends StatelessWidget {
  const BooksListViewWidget({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: books.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                navigateToDetails(context, books[index]);
              },
              child: CustomBookImage(
                image: books[index].image!,
              ),
            ),
          );
        },
      ),
    );
  }
}
