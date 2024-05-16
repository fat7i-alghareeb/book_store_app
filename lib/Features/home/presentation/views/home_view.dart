import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/Core/utils/functions/setup_service_locator.dart';
import 'package:book_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/animated_clipper.dart';
import '../../data/repos/home_repo_impl.dart';
import 'widgets/home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _clipperAnimationController;
  late Animation<double> _clipperAnimation;

  @override
  void initState() {
    super.initState();
    _clipperAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _clipperAnimation = Tween<double>(
      begin: 0.0,
      end: .8,
    ).animate(CurvedAnimation(
      parent: _clipperAnimationController,
      curve: Curves.decelerate,
    ));
    _clipperAnimationController.forward();
  }

  @override
  void dispose() {
    _clipperAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt<HomeRepoImpl>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt<HomeRepoImpl>())..fetchNewestBooks(),
        ),
      ],
      child: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedClipPath(
              clipperAnimation: _clipperAnimation,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.85),
            ),
            const HomeBody(),
          ],
        ),
      ),
    );
  }
}
