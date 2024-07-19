import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/utils/functions/get_image.dart';
import 'book_info.dart';
import '../../../../../../Core/shared/widgets/custom_book_image.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.height,
    required this.book,
  });
  final BookModel book;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.72,
          child: Hero(
            tag: book.coverEditionKey ?? book.coverId ?? 1,
            child: CustomBookImage(
              image: getImage(
                olid: book.coverEditionKey,
                id: book.coverId ?? 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: BookInfo(
            title: book.title ?? "",
            author: book.authorName?[0] ?? "",
          ),
        )
      ],
    );
  }
}
