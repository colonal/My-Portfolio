import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData desktopTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColorDark,
  primaryColorLight: AppColor.bodyColorHint,
  primaryColor: AppColor.bodyColor,
  primaryColorDark: AppColor.bodyColorDark,
  cardColor: AppColor.buttonBackgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColor.textColorDark,
      fontFamily: "Segone UI",
      fontSize: 60,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.7,
    ),
    headline2: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 60,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.7,
    ),
    headline3: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 30,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.7,
    ),
    headline4: TextStyle(
      color: AppColor.textColorDark,
      fontFamily: "Segone UI",
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.7,
    ),
    headline5: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 20,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.3,
    ),
    headline6: TextStyle(
      color: AppColor.textColor.withOpacity(0.6),
      fontSize: 20,
      fontWeight: FontWeight.w200,
    ),
  ),
);
