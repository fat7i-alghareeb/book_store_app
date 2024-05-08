import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books_cubit/featured_books_cubit.dart';
import '../../manger/featured_books_cubit/featured_books_state.dart';
import 'swiper_widget.dart';

class FeaturedBooksWidget extends StatelessWidget {
  const FeaturedBooksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: SwiperWidget(
              books: state.books,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
