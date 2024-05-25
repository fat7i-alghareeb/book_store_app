import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/shared/widgets/books_list_view.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import '../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_state.dart';

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
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    books = BlocProvider.of<RecentViewedBooksCubit>(context).books;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _jumpToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocConsumer<RecentViewedBooksCubit, RecentViewedBooksState>(
        listener: (context, state) {
          if (state is RecentViewedBooksSuccess) {
            books = BlocProvider.of<RecentViewedBooksCubit>(context).books;
            _jumpToTop();
          }
        },
        builder: (context, state) {
          if (state is RecentViewedBooksSuccess) {
            if (books.isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Text(
                    "You haven't viewed any books yet",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              );
            } else {
              return BooksListViewWidget(
                books: books,
                scrollController: scrollController,
                onPop: () {},
              );
            }
          } else if (state is RecentViewedBooksFailure) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Text(
                  state.errorMessage,
                  style: Styles.textStyle14,
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
