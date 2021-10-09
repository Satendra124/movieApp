import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff170821),
  splashColor: Color(0xfff79e44),
  scaffoldBackgroundColor: const Color(0xff170821),
  colorScheme: const ColorScheme(
      background: Color(0xff170821),
      brightness: Brightness.dark,
      error: Colors.red,
      onBackground: Colors.white,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      primary: Color(0xff170821),
      primaryVariant: Color(0xff210f37),
      secondary: Color(0xfff79e44),
      secondaryVariant: Color(0xff815325),
      surface: Color(0xff170821)),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.normal, color: Colors.white),
    headline3: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline4: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
    headline5: TextStyle(
        fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline6: TextStyle(
        fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.white),
    subtitle1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      fontSize: 18.0,
      fontStyle: FontStyle.normal,
      color: Colors.white,
    ),
    bodyText1: TextStyle(fontSize: 14.0),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);
