import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../manger/favorite box cubit/cubit/favorite_books_cubit.dart';
import '../../manger/favorite box cubit/cubit/favorite_books_state.dart';
import '../../manger/saved box cubit/cubit/saved_books_cubit.dart';
import '../../manger/saved box cubit/cubit/saved_books_state.dart';
import 'user_books_card_list_view.dart';

class BooksSection extends StatelessWidget {
  final String title;
  final List<BookEntity> books;
  final VoidCallback onBooksUpdated;
  final ScrollController scrollController;

  const BooksSection({
    super.key,
    required this.title,
    required this.books,
    required this.onBooksUpdated,
    required this.scrollController,
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
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        const SizedBox(height: 10),
        MultiBlocListener(
          listeners: [
            BlocListener<FavoriteBooksCubit, FavoriteBooksState>(
              listener: (context, state) {
                if (state is FavoriteBooksSuccess) {
                  onBooksUpdated();
                }
              },
            ),
            BlocListener<SavedBooksCubit, SavedBooksState>(
              listener: (context, state) {
                if (state is SavedBooksSuccess) {
                  onBooksUpdated();
                }
              },
            ),
          ],
          child: books.isEmpty
              ? const Center(child: Text('No books found'))
              : UserBooksCardListView(
                  books: books,
                  onPop: () => onBooksUpdated(),
                ),
        ),
      ],
    );
  }
}
