import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 20,
      tapOnlyMode: true,
      initialRating: rating,
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
      onRatingUpdate: (value) {
      },
    );
  }
}
