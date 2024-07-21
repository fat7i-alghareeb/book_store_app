import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////////
const lightMainColor = Color(0xFFffffff);
const lightSecondaryColor = Color(0xFFd4a056);
const lightThirdlyColor = Color.fromARGB(255, 0, 0, 0);
///////////////////////////////////////////////////////////////////
const darkMainColor = Color.fromARGB(255, 55, 55, 55);
const darkSecondaryColor = Color.fromARGB(255, 24, 187, 219);
const darkThirdlyColor = Color.fromARGB(255, 255, 255, 255);
///////////////////////////////////////////////////////////////////
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Cooper",
  drawerTheme: const DrawerThemeData(backgroundColor: lightMainColor),
  appBarTheme: const AppBarTheme(
    color: lightMainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: lightSecondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  primaryColor: lightMainColor,
  scaffoldBackgroundColor: lightMainColor,
  colorScheme: const ColorScheme.light(
    primary: lightMainColor,
    secondary: lightSecondaryColor,
    tertiary: lightThirdlyColor,
  ),
);
ThemeData darkMode = ThemeData(
  fontFamily: "Cooper",
  drawerTheme: const DrawerThemeData(backgroundColor: darkMainColor),
  appBarTheme: const AppBarTheme(
    color: darkMainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: darkSecondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: darkMainColor,
  scaffoldBackgroundColor: darkMainColor,
  colorScheme: const ColorScheme.dark(
    primary: darkMainColor,
    secondary: darkSecondaryColor,
    tertiary: darkThirdlyColor,
  ),
);
