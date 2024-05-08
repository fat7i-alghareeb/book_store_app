import 'package:flutter/material.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/shared/widgets/custom_book_image.dart';
import '../../../../../Core/shared/widgets/rating_bar_widget.dart';
import '../../../../../Core/utils/text_styles.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
    required this.book,
    required this.height,
  });

  final BookEntity book;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBookImage(image: book.image!),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  book.title,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  book.author,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                const RatingBarWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
