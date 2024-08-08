import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model.dart';
import 'book_option_widget.dart';

class AnimatedDetailsBottom extends StatelessWidget {
  const AnimatedDetailsBottom({
    super.key,
    required Animation<double> animation,
    required this.book,
  }) : _animation = animation;

  final Animation<double> _animation;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(3, 0),
        end: Offset.zero,
      ).animate(_animation),
      child: BookOptionWidget(
        book: book,
      ),
    );
  }
}
