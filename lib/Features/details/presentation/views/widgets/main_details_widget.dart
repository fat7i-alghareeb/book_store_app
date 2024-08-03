import '../../../data/models/book_details_model.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/text_styles.dart';
import 'book_categories.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
    required this.bookDetailsModel,
  });

  final BookDetailsModel bookDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookDetailsModel.bookDetails.title!,
            style: Styles.textStyle24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bookDetailsModel.author.name ?? "",
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    size: 25,
                    color: Colors.yellow[700],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    bookDetailsModel.rating.average?.toStringAsFixed(2) ?? "0",
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.yellow[700],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "/ ${bookDetailsModel.rating.count?.toString() ?? "0"}",
                style: Styles.textStyle14.copyWith(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          BookCategoriesWidget(
            subjects: bookDetailsModel.bookDetails.subjects ?? [],
          ),
        ],
      ),
    );
  }
}
