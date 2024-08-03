import '../../../../../../Core/utils/helper_extensions.dart';
import '../../../../data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/shared/widgets/error_widget.dart';
import '../../../../../../Core/utils/functions/build_error_snack_bar.dart';
import '../../../manger/trending_books_cubit/trending_books_cubit.dart';
import '../../../manger/trending_books_cubit/trending_books_state.dart';
import '../shimmer effects/featured_books_shimmer.dart';
import 'swiper_widget.dart';

class TrendingBooksWidget extends StatefulWidget {
  const TrendingBooksWidget({
    super.key,
    required this.controller,
  });
  final AnimationController controller;

  @override
  State<TrendingBooksWidget> createState() => _TrendingBooksWidgetState();
}

class _TrendingBooksWidgetState extends State<TrendingBooksWidget> {
  late List<BookModel> books;

  @override
  void initState() {
    books = context.getCubit<TrendingBooksCubit>().books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingBooksCubit, TrendingBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) books.addAll(state.books);

        if (state is TrendingBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage, context),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is TrendingBooksPaginationLoading ||
            state is TrendingBooksPaginationFailure) {
          widget.controller.forward();
          return SwiperWidget(
            books: books,
          );
        } else if (state is TrendingBooksFailure) {
          widget.controller.forward();

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            child: OnFetchErrorWidget(
              errorMessage: state.errMessage,
              onRetry: () {
                context.getCubit<TrendingBooksCubit>().fetchTrendingBooks();
              },
            ),
          );
        } else {
          return const FeaturedBooksShimmer();
        }
      },
    );
  }
}
