import 'package:flutter/material.dart';

import '../../../../../Core/shared/widgets/custom_book_image.dart';
import '../../../../../Core/utils/functions/get_image.dart';
import 'book_over_view.dart';
import 'details_screen_body.dart';
import 'main_details_widget.dart';

class AnimatedDetailsContent extends StatelessWidget {
  const AnimatedDetailsContent({
    super.key,
    required Animation<double> animation,
    required this.widget,
  }) : _animation = animation;

  final Animation<double> _animation;
  final DetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(_animation),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .12,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .35,
              child: Hero(
                tag: widget.book.key!,
                child: CustomBookImage(
                  image: getImage(
                    olid: widget.book.coverEditionKey,
                    id: widget.book.coverId,
                  ),
                ),
              ),
            ),
          ),
          MainDetailsWidget(bookDetailsModel: widget.bookDetailsModel),
          BookOverview(
            description:
                widget.bookDetailsModel.bookDetails.description?.value ?? " ",
          )
        ],
      ),
    );
  }
}
