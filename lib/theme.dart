import 'package:flutter/material.dart';

final noostarTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: lightGrey,
  primaryColor: darkBlue,
  accentColor: orange,
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: darkBlue,
    ),
    headline6: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: darkBlue,
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: white,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      height: 1.37,
      color: darkBlue,
    ),
    button: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: white,
    ),
    caption: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: white,
    ),
  ),
);

const orange = Color(0xFFFF5215);
const darkBlue = Color(0xFF0A063C);
const lightGrey = Color(0xFFF1F0F6);
const separatorGrey = Color(0xFFD7D6E4);
const grey = Color(0xFF8886A9);
const white = Color(0xFFFFFFFF);
const transparentBlack = Color(0x00000000);
const halfTransparentBlack = Color(0xD5000000);
const halfTransparentGrey = Color(0x59626262);
const darkGreen = Color(0xFF239621);
const lightGreen = Color(0xFFB1D64B);
const yellow = Color(0xFFF2C94C);
