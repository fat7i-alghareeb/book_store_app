import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../Core/utils/text_styles.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.title,
    required this.author,
  });
  final String title;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.textStyle20,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          author,
          maxLines: 1,
          style: Styles.textStyle11,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
