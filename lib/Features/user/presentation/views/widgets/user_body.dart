import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/domain/entities/book_entity.dart';
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
  late List<BookEntity> savedBooks;
  late List<BookEntity> favoriteBooks;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
    favoriteBooks = BlocProvider.of<FavoriteBooksCubit>(context).books;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void updateBooks() {
    setState(() {
      savedBooks = BlocProvider.of<SavedBooksCubit>(context).books;
      favoriteBooks = BlocProvider.of<FavoriteBooksCubit>(context).books;
    });
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
        ),
        BooksSection(
          title: "Saved Books :",
          books: savedBooks,
          onBooksUpdated: updateBooks,
          scrollController: scrollController,
        ),
        const SizedBox(
          height: 20,
        ),
        BooksSection(
          title: "Favorite Books :",
          books: favoriteBooks,
          onBooksUpdated: updateBooks,
          scrollController: scrollController,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
