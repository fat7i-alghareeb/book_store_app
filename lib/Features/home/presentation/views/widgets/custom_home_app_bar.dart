import 'package:book_app/Core/utils/helper_extensions.dart';
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
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Trending Books",
            style: Styles.textStyle24.copyWith(
              color: context.primaryColor(),
            ),
          ),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: context.primaryColor(),
            ),
          ),
        ],
      ),
    );
  }
}
