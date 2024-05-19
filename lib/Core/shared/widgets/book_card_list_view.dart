import 'package:book_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_card.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';

class BookCardListView extends StatefulWidget {
  const BookCardListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  State<BookCardListView> createState() => _BookCardListViewState();
}

class _BookCardListViewState extends State<BookCardListView> {
  late final ScrollController _scrollController;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.9 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: ++Constants.newestPageNumber)
            .whenComplete(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .25;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: widget.books.length + 1,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == widget.books.length) {
            return SizedBox(
              width: 200,
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }
          return BookCard(
            height: height,
            book: widget.books[index],
          );
        },
      ),
    );
  }
}
