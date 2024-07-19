import 'package:book_app/Core/utils/functions/get_image.dart';
import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import '../../../../../../Core/utils/functions/details_navigator.dart';
import 'package:flutter/material.dart';
import 'book_card_info.dart';
import '../../../../../../Core/shared/widgets/custom_book_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.height,
    required this.book,
  });
  final double height;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * .8;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<RecentViewedBooksCubit>(context)
              .addToRecentView(book);

          navigateToDetails(
            context,
            book,
            () {},
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: BookCardInfo(
                containerWidth: containerWidth,
                height: height * .8,
                title: book.title!,
                rating: book.ratingsAverage?.toDouble() ?? 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 5, 15),
              child: SizedBox(
                width: containerWidth * .4,
                child: Hero(
                  tag: book.coverEditionKey ?? book.coverId!,
                  child: CustomBookImage(
                    image: getImage(
                      olid: book.coverEditionKey,
                      id: book.coverId,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
