import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/functions/build_error_snack_bar.dart';
import '../../../manger/featured_books_cubit/featured_books_cubit.dart';
import '../../../manger/featured_books_cubit/featured_books_state.dart';
import '../shimmer effects/featured_books_shimmer.dart';
import 'swiper_widget.dart';

class FeaturedBooksWidget extends StatefulWidget {
  const FeaturedBooksWidget({
    super.key,
    required this.controller,
  });
  final AnimationController controller;

  @override
  State<FeaturedBooksWidget> createState() => _FeaturedBooksWidgetState();
}

class _FeaturedBooksWidgetState extends State<FeaturedBooksWidget> {
  late List<BookEntity> books;

  @override
  void initState() {
    books = BlocProvider.of<FeaturedBooksCubit>(context).books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) books.addAll(state.books);

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage, context),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          widget.controller.forward();
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: SwiperWidget(
              books: books,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          widget.controller.forward();

          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const FeaturedBooksShimmer();
        }
      },
    );
  }
}
