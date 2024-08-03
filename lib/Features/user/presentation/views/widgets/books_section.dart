import '../../../../../Core/shared/widgets/books_list_view.dart';
import '../../../../../Core/utils/helper_extensions.dart';
import '../../../../home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../manger/favorite box cubit/cubit/favorite_books_cubit.dart';
import '../../manger/favorite box cubit/cubit/favorite_books_state.dart';
import '../../manger/saved box cubit/cubit/saved_books_cubit.dart';
import '../../manger/saved box cubit/cubit/saved_books_state.dart';

class BooksSection extends StatelessWidget {
  final String title;
  final List<BookModel> books;
  final VoidCallback updateBooks;
  final VoidCallback fetchingTheChange;
  final ScrollController scrollController;

  const BooksSection({
    super.key,
    required this.title,
    required this.books,
    required this.updateBooks,
    required this.scrollController,
    required this.fetchingTheChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: Styles.textStyle24.copyWith(
                fontStyle: FontStyle.italic, color: context.accentColor()),
          ),
        ),
        const SizedBox(height: 10),
        MultiBlocListener(
          listeners: [
            BlocListener<FavoriteBooksCubit, FavoriteBooksState>(
              listener: (context, state) {
                if (state is FavoriteBooksSuccess) {
                  updateBooks();
                }
              },
            ),
            BlocListener<SavedBooksCubit, SavedBooksState>(
              listener: (context, state) {
                if (state is SavedBooksSuccess) {
                  updateBooks();
                }
              },
            ),
          ],
          child: books.isEmpty
              ? const Center(child: Text('No books found'))
              : BooksListViewWidget(
                  books: books,
                  onPop: () => fetchingTheChange(),
                  scrollController: scrollController,
                ),
        ),
      ],
    );
  }
}
