import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 20,
      initialRating: 4.4,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star_rate_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        half: Icon(
          Icons.star_half_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        empty: Icon(
          Icons.star_outline_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
