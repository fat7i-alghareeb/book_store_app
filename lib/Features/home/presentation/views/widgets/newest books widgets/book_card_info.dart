import 'package:book_app/Core/utils/helper_extensions.dart';

import '../../../../../../constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/utils/text_styles.dart';

class BookCardInfo extends StatelessWidget {
  const BookCardInfo({
    super.key,
    required this.containerWidth,
    required this.height,
    required this.title,
    required this.rating,
    required this.author,
  });

  final double containerWidth;
  final double height;
  final String title;
  final double rating;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 5,
      shadowColor: context.accentColor().withOpacity(.05),
      child: Container(
        height: height,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          color: context.accentColor().withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: containerWidth * .58,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: containerWidth * .58,
                child: Text(
                  author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: containerWidth * .58,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 23,
                      color: context.accentColor(),
                    ),
                    Text(
                      rating.toStringAsFixed(2),
                      style: Styles.textStyle14,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
