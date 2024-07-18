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
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.85),
        height: MediaQuery.of(context).size.height * .8,
      ),
    );
  }
}
