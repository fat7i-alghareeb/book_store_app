import '../../../../../Core/utils/helper_extensions.dart';
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
        color: context.accentColor().withOpacity(0.7),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            count,
            style: Styles.textStyle24.copyWith(
              color: context.primaryColor(),
            ),
          ),
          Text(
            indicatorTypeName,
            style: Styles.textStyle11.copyWith(
              color: context.onPrimaryColor(),
            ),
          )
        ],
      ),
    );
  }
}
