import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../../../../constants.dart';
import '../../manger/cubit/add_books_cubit.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  late bool isSaved;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isSaved = BlocProvider.of<AddBooksCubit>(context)
        .checkIfExists(widget.book, Constants.kSavedBookBox);
    isFavorite = BlocProvider.of<AddBooksCubit>(context)
        .checkIfExists(widget.book, Constants.kFavoriteBooksBox);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (isSaved) {
                  BlocProvider.of<AddBooksCubit>(context)
                      .removeFromSaved(widget.book);
                } else {
                  BlocProvider.of<AddBooksCubit>(context)
                      .addToSaved(widget.book);
                }
                isSaved = !isSaved;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSaved
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(Constants.kBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Save book",
                      style: Styles.textStyle24.copyWith(
                        fontStyle: FontStyle.italic,
                        color: isSaved
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isFavorite) {
                  BlocProvider.of<AddBooksCubit>(context)
                      .removeFromFavorite(widget.book);
                } else {
                  BlocProvider.of<AddBooksCubit>(context)
                      .addToFavorite(widget.book);
                }
                isFavorite = !isFavorite;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isFavorite
                    ? Colors.red[800]
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(Constants.kBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mark as Favorite",
                      style: Styles.textStyle24.copyWith(
                        color: isFavorite
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
