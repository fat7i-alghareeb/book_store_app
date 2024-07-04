import 'package:book_app/Features/navigator/presentation/views/widgets/theme_switch.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;

    return Drawer(
      width: x * .7,
      child: const SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: ThemeSwitch(lightTheme: true),
            ),
          ],
        ),
      ),
    );
  }
}
