import '../../utils/helper_extensions.dart';
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
          color: context.accentColor(),
        ),
        half: Icon(
          Icons.star_half_rounded,
          color: context.accentColor(),
        ),
        empty: Icon(
          Icons.star_outline_rounded,
          color: context.accentColor(),
        ),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
