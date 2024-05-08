import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Book Store",
            style: Styles.textStyle24.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          FaIcon(
            FontAwesomeIcons.bars,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
