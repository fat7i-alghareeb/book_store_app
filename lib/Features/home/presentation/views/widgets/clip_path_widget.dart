import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

import 'clipper.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MainClipper(),
      child: Container(
        color: context.accentColor().withOpacity(0.85),
        height: MediaQuery.of(context).size.height * .8,
      ),
    );
  }
}
