import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:book_app/Features/details/presentation/manger/details%20book%20cubit/cubit/details_book_cubit.dart';
import 'package:book_app/Features/details/presentation/manger/details%20book%20cubit/cubit/details_book_state.dart';
import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/details_screen_body.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.book});
  final BookModel book;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.getCubit<DetailsBookCubit>().fetchBookDetails(
          bookPath: widget.book.key!,
          authorId: widget.book.authorKey![0],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsBookCubit, DetailsBookState>(
        builder: (context, state) {
          if (state is DetailsBookSuccess) {
            return DetailsBody(
              book: widget.book,
              bookDetailsModel: state.bookDetailsModel,
            );
          } else if (state is DetailsBookFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: context.accentColor(),
              ),
            );
          }
        },
      ),
    );
  }
}
