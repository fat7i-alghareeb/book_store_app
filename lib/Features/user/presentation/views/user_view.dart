import 'package:book_app/Features/user/presentation/manger/favorite%20box%20cubit/cubit/favorite_books_state.dart';
import 'package:book_app/Features/user/presentation/manger/saved%20box%20cubit/cubit/saved_books_state.dart';

import '../../data/repo/user_repo_imp.dart';
import '../manger/favorite%20box%20cubit/cubit/favorite_books_cubit.dart';
import '../manger/saved%20box%20cubit/cubit/saved_books_cubit.dart';
import 'widgets/user_books_card_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/domain/entities/book_entity.dart';
import '../../../../Core/shared/widgets/books_list_view.dart';
import '../../../../Core/utils/functions/setup_service_locator.dart';
import '../../../../Core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_info.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SavedBooksCubit(getIt<UserRepoImp>())..fetchSavedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteBooksCubit(getIt<UserRepoImp>())..fetchFavoriteBooks(),
        ),
      ],
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: UserBody(),
        ),
      ),
    );
  }
}

class UserBody extends StatefulWidget {
  const UserBody({
    super.key,
  });

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  late List<BookEntity> savedBooks;
  late List<BookEntity> favoriteBooks;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
    favoriteBooks = BlocProvider.of<FavoriteBooksCubit>(context).books;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ProfileInfo(
            savedBooksNumber: savedBooks.length,
            favoriteBooksNumber: favoriteBooks.length,
          ),
        ),
        Divider(
          indent: width * .15,
          endIndent: width * .15,
          color: Theme.of(context).colorScheme.secondary,
          // endIndent: width * .85,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Your Saved Books (${savedBooks.length})",
            style: Styles.textStyle24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MultiBlocListener(
            listeners: [
              BlocListener<FavoriteBooksCubit, FavoriteBooksState>(
                listener: (context, state) {
                  savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
                  favoriteBooks =
                      BlocProvider.of<FavoriteBooksCubit>(context).books;
                },
              ),
              BlocListener<SavedBooksCubit, SavedBooksState>(
                listener: (context, state) {
                  savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
                  favoriteBooks =
                      BlocProvider.of<FavoriteBooksCubit>(context).books;
                },
              ),
            ],
            child: UserBooksCardListView(
              books: savedBooks,
              onPop: () => setState(() {
                BlocProvider.of<SavedBooksCubit>(context).fetchSavedBooks();
                BlocProvider.of<FavoriteBooksCubit>(context)
                    .fetchFavoriteBooks();
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Your Favorite Books (${favoriteBooks.length})",
            style: Styles.textStyle24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MultiBlocListener(
            listeners: [
              BlocListener<FavoriteBooksCubit, FavoriteBooksState>(
                listener: (context, state) {
                  savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
                  favoriteBooks =
                      BlocProvider.of<FavoriteBooksCubit>(context).books;
                },
              ),
              BlocListener<SavedBooksCubit, SavedBooksState>(
                listener: (context, state) {
                  savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
                  favoriteBooks =
                      BlocProvider.of<FavoriteBooksCubit>(context).books;
                },
              ),
            ],
            child: BooksListViewWidget(
              books: favoriteBooks,
              scrollController: scrollController,
              onPop: () => setState(() {
                BlocProvider.of<SavedBooksCubit>(context).fetchSavedBooks();
                BlocProvider.of<FavoriteBooksCubit>(context)
                    .fetchFavoriteBooks();
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
