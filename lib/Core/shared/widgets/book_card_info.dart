import 'package:book_app/Core/shared/widgets/rating_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/text_styles.dart';

class BookCardInfo extends StatelessWidget {
  const BookCardInfo({
    super.key,
    required this.containerWidth,
    required this.height,
    required this.title,
    required this.description, required this.rating,
  });

  final double containerWidth;
  final double height;
  final String title;
  final String description;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: containerWidth * .5,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: containerWidth * .5,
              child: Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle11,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: containerWidth * .5,
              child:  RatingBarWidget(
                rating:rating ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
