import '../../../../../Core/domain/entities/book_entity.dart';
import '../../manger/cubit/add_books_cubit.dart';
import '../../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/text_styles.dart';
import 'details_bottom_sheet_body.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: hight,
        child: Row(
          children: [
            Container(
              width: width * .65,
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
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  showBottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Constants.kBorderRadius),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.format_list_bulleted_add,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
            body: DetailsBottomSheetBody(
              book: book,
            ),
          ),
        );
      },
    );
  }
}
