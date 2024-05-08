import 'package:book_app/Core/domain/entities/book_entity.dart';
import 'package:book_app/Core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/book_option_widget.dart';
import 'widgets/main_details_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                ),
              ),
              MainDetailsWidget(book: book, height: height * 0.25),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: BookOptionWidget(hight: height * .07),
              ),
              const Text(
                "About this Book : ",
                style: Styles.textStyle24,
              ),
              Text(
                book.description,
                style: Styles.textStyle14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
