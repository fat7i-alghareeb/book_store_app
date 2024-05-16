import '../../domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'book_info.dart';
import 'custom_book_image.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.height,
    required this.book,
  });
  final BookEntity book;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.7,
          child: Hero(
            tag: book.bookId,
            child: CustomBookImage(
              image: book.image!,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: BookInfo(
            title: book.title,
            author: book.author,
          ),
        )
      ],
    );
  }
}
