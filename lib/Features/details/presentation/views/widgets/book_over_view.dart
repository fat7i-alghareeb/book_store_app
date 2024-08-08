import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';

class BookOverview extends StatelessWidget {
  const BookOverview({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            description,
            style: Styles.textStyle14,
          ),
        ],
      ),
    );
  }
}
