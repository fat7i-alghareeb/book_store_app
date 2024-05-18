import '../../utils/router/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/book_entity.dart';
import 'book_card_info.dart';
import 'custom_book_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.height,
    required this.book,
  });
  final double height;
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * .8;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, KRouter.detailsScreen, arguments: book);
          HapticFeedback.heavyImpact();
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: BookCardInfo(
                containerWidth: containerWidth,
                height: height * .8,
                title: book.title,
                description: book.description,
                rating: book.rating.toDouble(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 5, 15),
              child: SizedBox(
                width: containerWidth * .4,
                child: Hero(
                  tag: book.bookId,
                  child: CustomBookImage(image: book.image!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
