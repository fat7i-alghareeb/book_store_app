import 'package:book_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../manger/cubit/add_books_cubit.dart';
import 'add_option_button.dart';

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
          OptionButton(
            label: "Save book",
            icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
            isActive: isSaved,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.primary,
            onTap: () => _toggleSaveStatus(),
          ),
          const SizedBox(height: 15),
          OptionButton(
            label: "Mark as Favorite",
            icon: isFavorite ? Icons.favorite : Icons.favorite_border,
            isActive: isFavorite,
            activeColor: Colors.red[800]!,
            inactiveColor: Theme.of(context).colorScheme.primary,
            onTap: () => _toggleFavoriteStatus(),
          ),
        ],
      ),
    );
  }

  void _toggleSaveStatus() {
    setState(() {
      if (isSaved) {
        BlocProvider.of<AddBooksCubit>(context).removeFromSaved(widget.book);
      } else {
        BlocProvider.of<AddBooksCubit>(context).addToSaved(widget.book);
      }
      isSaved = !isSaved;
    });
  }

  void _toggleFavoriteStatus() {
    setState(() {
      if (isFavorite) {
        BlocProvider.of<AddBooksCubit>(context).removeFromFavorite(widget.book);
      } else {
        BlocProvider.of<AddBooksCubit>(context).addToFavorite(widget.book);
      }
      isFavorite = !isFavorite;
    });
  }
}
