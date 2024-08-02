import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../Core/shared/widgets/app_icon.dart';
import '../../../../../Core/shared/widgets/custom_book_image.dart';
import '../../../../../Core/utils/functions/get_image.dart';
import '../../../../../Core/utils/text_styles.dart';
import '../../../../home/data/models/book_model.dart';
import '../../../../home/presentation/views/widgets/clipper.dart';
import '../../../data/models/book_details_model.dart';
import 'book_option_widget.dart';
import 'main_details_widget.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.book,
    required this.bookDetailsModel,
  });

  final BookDetailsModel bookDetailsModel;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: DetailsClipper(),
                      child: Container(
                        color: context.neutralColor(),
                        height: MediaQuery.of(context).size.height * .95,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .35,
                            child: Hero(
                              tag: book.key!,
                              child: CustomBookImage(
                                image: getImage(
                                  olid: book.coverEditionKey,
                                  id: book.coverId,
                                ),
                              ),
                            ),
                          ),
                        ),
                        MainDetailsWidget(bookDetailsModel: bookDetailsModel),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Book Overview ",
                                style: Styles.textStyle24,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                bookDetailsModel
                                        .bookDetails.description?.value ??
                                    " ",
                                style: Styles.textStyle14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const DetailsBackButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
        BookOptionWidget(
          hight: height * .081,
          book: book,
        ),
      ],
    );
  }
}

class DetailsBackButton extends StatelessWidget {
  const DetailsBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: AppIcon(
          onPressed: () {
            Navigator.pop(context);
            HapticFeedback.heavyImpact();
          },
          color: context.primaryColor(),
          widget: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.accentColor(),
            size: 25,
          ),
        ),
      ),
    );
  }
}
