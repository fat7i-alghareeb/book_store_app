import 'package:flutter/material.dart';
import '../../../../home/data/models/book_model.dart';
import '../../../data/models/book_details_model.dart';
import 'animated_details_bottom.dart';
import 'animated_details_clipper.dart';
import 'animated_details_content.dart';
import 'details_back_button.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({
    super.key,
    required this.book,
    required this.bookDetailsModel,
  });

  final BookDetailsModel bookDetailsModel;
  final BookModel book;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    AnimatedDetailsClipper(animation: _animation),
                    AnimatedDetailsContent(
                        animation: _animation, widget: widget),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: const DetailsBackButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AnimatedDetailsBottom(animation: _animation, book: widget.book),
      ],
    );
  }
}
