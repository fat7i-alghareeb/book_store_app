import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/shared/widgets/book_card_list_view.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import '../../manger/newest_books_cubit/newest_books_state.dart';

class NewestBooksWidget extends StatelessWidget {
  const NewestBooksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: BookCardListView(
              books: state.books,
            ),
          );
        } else if (state is NewestBooksFailure) {
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
