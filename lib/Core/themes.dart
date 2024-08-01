import 'package:flutter/material.dart';

const accentColor = Color(0xFFd4a056);
///////////////////////////////////////////////////////////////////
const lightMainColor = Color(0xFFFFFFFF);
const lightOnPrimaryColor = Colors.black;
const lightNeutralColor = Color(0xFFF4F4F4);
///////////////////////////////////////////////////////////////////
const darkMainColor = Color(0xFF1F1A12);
const darkOnPrimaryColor = Colors.white;
const darkNeutralColor = Color(0xFF342F3F);

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
