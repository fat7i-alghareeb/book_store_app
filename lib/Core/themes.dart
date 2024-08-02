import 'package:flutter/material.dart';

const accentColor = Color(0xFFd4a056);
///////////////////////////////////////////////////////////////////
const lightMainColor = Color(0xFFFFFFFF);
const lightOnPrimaryColor = Colors.black;
const lightNeutralColor = Color.fromARGB(255, 235, 235, 235);
///////////////////////////////////////////////////////////////////
const darkMainColor = Color(0xFF2f4858);
const darkOnPrimaryColor = Colors.white;
const darkNeutralColor = Color.fromARGB(255, 85, 102, 112);

///////////////////////////////////////////////////////////////////
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Cooper",
  primaryColor: lightMainColor,
  drawerTheme: const DrawerThemeData(backgroundColor: lightMainColor),
  scaffoldBackgroundColor: lightMainColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightMainColor,
  ),
  colorScheme: const ColorScheme.light(
    primary: lightMainColor,
    onPrimary: lightOnPrimaryColor,
    tertiary: lightNeutralColor,
    secondary: accentColor,
  ),
);
///////////////////////////////////////////////////////////////
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Cooper",
  drawerTheme: const DrawerThemeData(backgroundColor: darkMainColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkMainColor,
  ),
  primaryColor: darkMainColor,
  scaffoldBackgroundColor: darkMainColor,
  colorScheme: const ColorScheme.dark(
    primary: darkMainColor,
    onPrimary: darkOnPrimaryColor,
    tertiary: darkNeutralColor,
    secondary: accentColor,
  ),
);
