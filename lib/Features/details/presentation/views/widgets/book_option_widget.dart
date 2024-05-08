import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';

class BookOptionWidget extends StatelessWidget {
  const BookOptionWidget({
    super.key,
    required this.hight,
  });
  final double hight;
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
              borderRadius: BorderRadius.circular(12),
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
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
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
        ],
      ),
    );
  }
}
