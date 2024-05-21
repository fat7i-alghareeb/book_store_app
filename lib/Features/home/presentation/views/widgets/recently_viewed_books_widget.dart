import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/Features/home/presentation/manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import 'package:book_app/Features/home/presentation/manger/recent_viewed_books_cubit/cubit/recent_viewed_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/shared/widgets/books_list_view.dart';

class RecentlyViewedBooksWidget extends StatefulWidget {
  const RecentlyViewedBooksWidget({
    super.key,
  });

  @override
  State<RecentlyViewedBooksWidget> createState() =>
      _RecentlyViewedBooksWidgetState();
}

class _RecentlyViewedBooksWidgetState extends State<RecentlyViewedBooksWidget> {
  late List<BookEntity> books;

  @override
  void initState() {
    books = BlocProvider.of<RecentViewedBooksCubit>(context).books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocConsumer<RecentViewedBooksCubit, RecentViewedBooksState>(
        listener: (context, state) {
          if (state is RecentViewedBooksSuccess)
            books = BlocProvider.of<RecentViewedBooksCubit>(context).books;
        },
        builder: (context, state) {
          if (state is RecentViewedBooksSuccess) {
            if (books.isEmpty) {
              return const Center(
                child: Text("fuck"),
              );
            } else {
              return BooksListViewWidget(
                books: books,
              );
            }
          } else if (state is RecentViewedBooksFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
