import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../Core/shared/widgets/app_icon.dart';

class DetailsBackButton extends StatelessWidget {
  const DetailsBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: AppIcon(
          onPressed: () {
            Navigator.pop(context);
            HapticFeedback.heavyImpact();
          },
          color: context.primaryColor(),
          widget: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.accentColor(),
            size: 25,
          ),
        ),
      ),
    );
  }
}
