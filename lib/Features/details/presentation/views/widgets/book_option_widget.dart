import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/Features/details/presentation/manger/cubit/add_books_cubit.dart';
import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/text_styles.dart';

class BookOptionWidget extends StatelessWidget {
  const BookOptionWidget({
    super.key,
    required this.hight,
    required this.book,
  });
  final double hight;
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: hight,
      child: Row(
        children: [
          Container(
            width: width * .6,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              borderRadius: BorderRadius.circular(Constants.kBorderRadius),
            ),
            child: Center(
              child: Text(
                "Read",
                style: Styles.textStyle24.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                HapticFeedback.heavyImpact();
                showBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(Constants.kBorderRadius),
                ),
                child: Center(
                  child: Icon(
                    Icons.format_list_bulleted_add,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => AddBooksCubit(),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  HapticFeedback.heavyImpact();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/expand-button.png",
                    height: 23,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            body: BottomSheetBody(
              book: book,
            ),
          ),
        );
      },
    );
  }
}

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
    isSaved = BlocProvider.of<AddBooksCubit>(context)
        .checkIfExists(widget.book, Constants.kSavedBookBox);
    isFavorite = BlocProvider.of<AddBooksCubit>(context)
        .checkIfExists(widget.book, Constants.kFavoriteBooksBox);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Save book",
                style: Styles.textStyle24.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Checkbox(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                value: isSaved,
                onChanged: (value) {
                  if (isSaved) {
                    BlocProvider.of<AddBooksCubit>(context)
                        .removeFromSaved(widget.book);
                  } else {
                    BlocProvider.of<AddBooksCubit>(context)
                        .addToSaved(widget.book);
                  }
                  setState(() {
                    isSaved = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add to Favorite",
                style: Styles.textStyle24.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Checkbox(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                value: isFavorite,
                onChanged: (value) {
                  if (isFavorite) {
                    BlocProvider.of<AddBooksCubit>(context)
                        .removeFromFavorite(widget.book);
                  } else {
                    BlocProvider.of<AddBooksCubit>(context)
                        .addToFavorite(widget.book);
                  }
                  setState(() {
                    isFavorite = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
