import 'package:flutter/material.dart';

import '../../../../../Core/utils/text_styles.dart';

class IndicatorBooksWidget extends StatelessWidget {
  const IndicatorBooksWidget({
    super.key,
    required this.count,
    required this.indicatorTypeName,
  });
  final String count;
  final String indicatorTypeName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            count,
            style: Styles.textStyle24.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            indicatorTypeName,
            style: Styles.textStyle11,
          )
        ],
      ),
    );
  }
}
