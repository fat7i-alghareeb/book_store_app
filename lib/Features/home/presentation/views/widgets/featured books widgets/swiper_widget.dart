import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../../Core/shared/widgets/book_widget.dart';
import '../../../../../../Core/utils/functions/details_navigator.dart';
import '../../../../../../constants.dart';
import '../../../manger/featured_books_cubit/featured_books_cubit.dart';
import '../../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';

class SwiperWidget extends StatelessWidget {
  final List<BookEntity> books;

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
        index: Constants.featuredBooksPageNumber * 10 + 1,
        onIndexChanged: (index) async {
          if (index >= books.length - 2 && !isLoading) {
            isLoading = true;
            await BlocProvider.of<FeaturedBooksCubit>(context)
                .fetchFeaturedBooks(
                    pageNumber: ++Constants.featuredBooksPageNumber)
                .whenComplete(() => isLoading = false);
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
                  color: Theme.of(context).colorScheme.secondary,
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
