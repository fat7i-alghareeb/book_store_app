import '../../../../../Core/utils/helper_extensions.dart';
import '../../../../home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../manger/favorite box cubit/cubit/favorite_books_cubit.dart';
import '../../manger/saved box cubit/cubit/saved_books_cubit.dart';
import 'books_section.dart';
import 'profile_info.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  late List<BookModel> savedBooks;
  late List<BookModel> favoriteBooks;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    savedBooks = context.getCubit<SavedBooksCubit>().books;
    favoriteBooks = context.getCubit<FavoriteBooksCubit>().books;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void updateBooks() {
    setState(() {
      savedBooks = context.getCubit<SavedBooksCubit>().books;
      favoriteBooks = context.getCubit<FavoriteBooksCubit>().books;
    });
  }

  void fetchingTheChange() {
    context.getCubit<SavedBooksCubit>().fetchSavedBooks();
    context.getCubit<FavoriteBooksCubit>().fetchFavoriteBooks();
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
          color: context.accentColor(),
        ),
        BooksSection(
          title: "Saved Books :",
          books: savedBooks,
          updateBooks: updateBooks,
          scrollController: scrollController,
          fetchingTheChange: fetchingTheChange,
        ),
        const SizedBox(
          height: 20,
        ),
        BooksSection(
          title: "Favorite Books :",
          books: favoriteBooks,
          updateBooks: updateBooks,
          scrollController: scrollController,
          fetchingTheChange: fetchingTheChange,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
