import '../../utils/functions/get_image.dart';
import '../../../Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Features/home/presentation/manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import '../../utils/functions/details_navigator.dart';
import 'package:flutter/material.dart';
import '../../../Features/home/presentation/views/widgets/newest books widgets/book_card_info.dart';
import 'custom_book_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.height,
    required this.book,
    required this.containerWidth,
  });
  final double height;
  final BookModel book;
  final double containerWidth;
  @override
  Widget build(BuildContext context) {
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
            BookCardInfo(
              containerWidth: containerWidth,
              height: height * .7,
              title: book.title!,
              author: book.authorName?[0] ?? " ",
              rating: book.ratingsAverage?.toDouble() ?? 0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: SizedBox(
                height: height * .8,
                child: Hero(
                  tag: book.coverEditionKey ?? book.coverId ?? 1,
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
