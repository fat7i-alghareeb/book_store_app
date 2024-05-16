import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../../../Core/shared/widgets/book_widget.dart';
import '../../../../../Core/domain/entities/book_entity.dart';
import '../../../../../Core/utils/functions/details_navigator.dart';

class SwiperWidget extends StatelessWidget {
  final List<BookEntity> books;

  const SwiperWidget({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.38;
    return SizedBox(
      height: height,
      child: Swiper(
        index: 1,
        loop: false,
        viewportFraction: 0.45,
        scale: 0.6,
        itemCount: books.length,
        duration: 800,
        autoplay: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateToDetails(context, books[index]);
            },
            child: BookWidget(
              height: height,
              book: books[index],
            ),
          );
        },
      ),
    );
  }
}
