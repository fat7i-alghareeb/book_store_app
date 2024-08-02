import 'package:book_app/Core/shared/cubit/user_info_cubit.dart';
import 'package:book_app/Core/utils/helper_extensions.dart';
import 'package:flutter/services.dart';
import '../../../home/presentation/views/home_view.dart';
import 'widgets/custom%20bottom%20bar.dart/bottom_nav.dart';
import '../../../search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../../user/presentation/views/user_view.dart';
import 'widgets/drawer_widget.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const Home(),
    const SearchView(),
    const UserView(),
  ];
  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: context.primaryColor(),
      ),
    );
    return Scaffold(
      endDrawer: const DrawerWidget(),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: _screen,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
