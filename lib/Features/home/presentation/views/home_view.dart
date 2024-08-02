import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../Core/utils/functions/check_cache.dart';
import '../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';
import '../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/functions/setup_service_locator.dart';
import '../manger/trending_books_cubit/trending_books_cubit.dart';
import '../manger/newest_books_cubit/newest_books_cubit.dart';
import 'widgets/animated_clipper.dart';
import '../../data/repos/home_repo.dart';
import 'widgets/home_content.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _clipperAnimationController;
  late Animation<double> _clipperAnimation;

  @override
  void initState() {
    _init();
    super.initState();
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
              TrendingBooksCubit(getIt<HomeRepo>())..fetchTrendingBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt<HomeRepo>())..fetchNewestBooks(),
        ),
      ],
      child: HomeBody(
          clipperAnimation: _clipperAnimation,
          clipperAnimationController: _clipperAnimationController),
    );
  }

  void _init() {
    checkCache().then(
      (value) {
        Constants.trendingBooksPageNumber = 1;
        Constants.newestPageNumber = 1;
        context.getCubit<RecentViewedBooksCubit>().fetchRecentViewedBooks();
        _clipperAnimationController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        );
        _clipperAnimation = Tween<double>(
          begin: 0.0,
          end: .65,
        ).animate(CurvedAnimation(
          parent: _clipperAnimationController,
          curve: Curves.decelerate,
        ));
      },
    );
    Constants.trendingBooksPageNumber = 1;
    Constants.newestPageNumber = 1;
    context.getCubit<RecentViewedBooksCubit>().fetchRecentViewedBooks();
    _clipperAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _clipperAnimation = Tween<double>(
      begin: 0.0,
      end: .65,
    ).animate(CurvedAnimation(
      parent: _clipperAnimationController,
      curve: Curves.decelerate,
    ));
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
    required Animation<double> clipperAnimation,
    required AnimationController clipperAnimationController,
  })  : _clipperAnimation = clipperAnimation,
        _clipperAnimationController = clipperAnimationController;

  final Animation<double> _clipperAnimation;
  final AnimationController _clipperAnimationController;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future<void> _handleRefresh() async {
    final trendingBooksCubit = context.getCubit<TrendingBooksCubit>();
    final newestBooksCubit = context.getCubit<NewestBooksCubit>();

    await checkCache(clearNow: true);
    await Future.wait([
      trendingBooksCubit.fetchTrendingBooks(),
      newestBooksCubit.fetchNewestBooks(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: context.accentColor(),
      backgroundColor: context.primaryColor(),
      onRefresh: _handleRefresh,
      animSpeedFactor: 3,
      springAnimationDurationInMilliseconds: 700,
      showChildOpacityTransition: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AnimatedClipPath(
                  clipperAnimation: widget._clipperAnimation,
                  color: context.accentColor(),
                ),
                HomeContent(
                  controller: widget._clipperAnimationController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
