import 'dart:ui';

import 'package:flutter/material.dart';

import 'nav_icon.dart';

class CustomBottomBar extends StatelessWidget {
  final void Function(int) onItemTapped;
  final int selectedIndex;
  const CustomBottomBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: context.accentColor().withOpacity(0.05),
      //margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 70,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigatorIcon(
                  icon: Icons.menu_book_rounded,
                  setChange: () {
                    onItemTapped(0);
                  },
                  changing: selectedIndex == 0 ? true : false,
                ),
                NavigatorIcon(
                  icon: Icons.search,
                  setChange: () {
                    onItemTapped(1);
                  },
                  changing: selectedIndex == 1 ? true : false,
                ),
                NavigatorIcon(
                  icon: Icons.person,
                  setChange: () {
                    onItemTapped(2);
                  },
                  changing: selectedIndex == 2 ? true : false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
