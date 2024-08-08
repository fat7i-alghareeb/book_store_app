import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/clipper.dart';

class AnimatedDetailsClipper extends StatelessWidget {
  const AnimatedDetailsClipper({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(_animation),
      child: ClipPath(
        clipper: DetailsClipper(),
        child: Container(
          color: context.neutralColor(),
          height: MediaQuery.of(context).size.height * .95,
        ),
      ),
    );
  }
}
