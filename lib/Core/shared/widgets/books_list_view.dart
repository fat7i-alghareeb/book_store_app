import 'package:flutter/material.dart';

import '../../../Features/home/data/models/book_model.dart';
import '../../utils/functions/details_navigator.dart';
import '../../utils/functions/get_image.dart';
import 'custom_book_image.dart';

class BooksListViewWidget extends StatelessWidget {
  const BooksListViewWidget({
    super.key,
    required this.books,
    required this.scrollController,
    required this.onPop,
  });
  final List<BookModel> books;
  final void Function() onPop;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final reversedBooks = books.reversed.toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: reversedBooks.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                navigateToDetails(context, reversedBooks[index], onPop);
              },
              child: CustomBookImage(
                image: getImage(
                  olid: reversedBooks[index].coverEditionKey,
                  id: reversedBooks[index].coverId,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
