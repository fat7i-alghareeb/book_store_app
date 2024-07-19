import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_card_list_view.dart';
import '../../../../../../Core/shared/widgets/error_widget.dart';
import '../../../../../../Core/utils/functions/build_error_snack_bar.dart';
import '../../../manger/newest_books_cubit/newest_books_cubit.dart';
import '../../../manger/newest_books_cubit/newest_books_state.dart';
import '../shimmer effects/newest_books_shimmer.dart';

class NewestBooksWidget extends StatefulWidget {
  const NewestBooksWidget({
    super.key,
  });

  @override
  State<NewestBooksWidget> createState() => _NewestBooksWidgetState();
}

class _NewestBooksWidgetState extends State<NewestBooksWidget> {
  late List<BookModel> books;

  @override
  void initState() {
    books = BlocProvider.of<NewestBooksCubit>(context).books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) books.addAll(state.books);

        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage, context),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: HomeBookCardListView(
              books: books,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: OnFetchErrorWidget(
              errorMessage: state.errMessage,
              onRetry: () {
                BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
              },
            ),
          );
        } else {
          return const NewestBooksShimmer();
        }
      },
    );
  }
}
