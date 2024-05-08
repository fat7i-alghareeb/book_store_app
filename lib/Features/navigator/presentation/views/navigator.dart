import 'package:book_app/Features/home/presentation/views/home_view.dart';
import 'package:book_app/Features/navigator/presentation/views/widgets/custom%20bottom%20bar.dart/bottom_nav.dart';
import 'package:book_app/Features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../../user/presentation/views/user_view.dart';

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

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
