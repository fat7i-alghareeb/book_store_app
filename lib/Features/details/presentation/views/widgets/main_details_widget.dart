import 'package:book_app/Features/details/data/models/book_details_model.dart';
import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/text_styles.dart';

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
            bookDetailsModel.bookDetails.authors![0].author!.key ?? "",
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
          const BookCategoriesWidget(),
        ],
      ),
    );
  }
}

class BookCategoriesWidget extends StatelessWidget {
  const BookCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryContainerWidget(
            categoryName: "Poetry",
          ),
          CategoryContainerWidget(
            categoryName: "History",
          ),
          CategoryContainerWidget(
            categoryName: "Romance",
          ),
          CategoryContainerWidget(
            categoryName: "Action",
          ),
          CategoryContainerWidget(
            categoryName: "fuck",
          )
        ],
      ),
    );
  }
}

class CategoryContainerWidget extends StatelessWidget {
  const CategoryContainerWidget({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Constants.kBorderRadius,
          ),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              categoryName,
              style: Styles.textStyle14.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
