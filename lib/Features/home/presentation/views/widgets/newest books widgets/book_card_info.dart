import '../../../../../../Core/shared/widgets/rating_bar_widget.dart';
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
  });

  final double containerWidth;
  final double height;
  final String title;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 5,
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(.05),
      child: Container(
        width: containerWidth,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
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
                  style: Styles.textStyle20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: containerWidth * .5,
                child: RatingBarWidget(
                  rating: rating,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
