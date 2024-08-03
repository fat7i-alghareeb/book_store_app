import '../../../../../Core/utils/helper_extensions.dart';
import '../../../../home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../manger/cubit/add_books_cubit.dart';
import 'bottom_sheet_option_button.dart';

class DetailsBottomSheetBody extends StatefulWidget {
  const DetailsBottomSheetBody({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  State<DetailsBottomSheetBody> createState() => _DetailsBottomSheetBodyState();
}

class _DetailsBottomSheetBodyState extends State<DetailsBottomSheetBody> {
  late bool isSaved;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isSaved = context
        .getCubit<AddBooksCubit>()
        .checkIfExists(widget.book, Constants.kSavedBookBox);
    isFavorite = context
        .getCubit<AddBooksCubit>()
        .checkIfExists(widget.book, Constants.kFavoriteBooksBox);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Column(
        children: [
          BottomSheetOptionButton(
            label: "Save book",
            icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
            isActive: isSaved,
            activeColor: context.accentColor(),
            inactiveColor: Colors.grey[200]!,
            onTap: () => _toggleSaveStatus(),
          ),
          const SizedBox(height: 15),
          BottomSheetOptionButton(
            label: "Mark as Favorite",
            icon: isFavorite ? Icons.favorite : Icons.favorite_border,
            isActive: isFavorite,
            activeColor: Colors.red[800]!,
            inactiveColor: Colors.grey[200]!,
            onTap: () => _toggleFavoriteStatus(),
          ),
        ],
      ),
    );
  }

  void _toggleSaveStatus() {
    setState(() {
      if (isSaved) {
        context.getCubit<AddBooksCubit>().removeFromSaved(widget.book);
      } else {
        context.getCubit<AddBooksCubit>().addToSaved(widget.book);
      }
      isSaved = !isSaved;
    });
  }

  void _toggleFavoriteStatus() {
    setState(() {
      if (isFavorite) {
        context.getCubit<AddBooksCubit>().removeFromFavorite(widget.book);
      } else {
        context.getCubit<AddBooksCubit>().addToFavorite(widget.book);
      }
      isFavorite = !isFavorite;
    });
  }
}
