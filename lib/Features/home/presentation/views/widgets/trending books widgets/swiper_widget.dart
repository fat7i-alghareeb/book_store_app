import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_widget.dart';
import '../../../../../../Core/utils/functions/details_navigator.dart';
import '../../../../../../constants.dart';
import '../../../manger/trending_books_cubit/trending_books_cubit.dart';
import '../../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';

class SwiperWidget extends StatelessWidget {
  final List<BookModel> books;

  const SwiperWidget({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.38;
    bool isLoading = false;

    return SizedBox(
      height: height,
      child: Swiper(
        index: (Constants.trendingBooksPageNumber - 1) * 10 + 1,
        onIndexChanged: (index) async {
          if (index >= books.length - 2 && !isLoading) {
            isLoading = true;
            await BlocProvider.of<TrendingBooksCubit>(context)
                .fetchTrendingBooks(
                  pageNumber: ++Constants.trendingBooksPageNumber,
                )
                .whenComplete(
                  () => isLoading = false,
                );
          }
        },
        loop: false,
        viewportFraction: 0.45,
        scale: 0.6,
        itemCount: books.length + 1,
        duration: 800,
        autoplay: false,
        itemBuilder: (context, index) {
          if (index == books.length) {
            if (!isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.accentColor(),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
          return GestureDetector(
            onTap: () {
              BlocProvider.of<RecentViewedBooksCubit>(context)
                  .addToRecentView(books[index]);
              navigateToDetails(
                context,
                books[index],
                () {},
              );
            },
            child: BookWidget(
              height: height,
              book: books[index],
            ),
          );
        },
      ),
    );
  }
}
