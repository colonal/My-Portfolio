import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData desktopTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColorDark,
  primaryColorLight: AppColor.bodyColorHint,
  primaryColor: AppColor.bodyColor,
  primaryColorDark: AppColor.bodyColorDark,
  cardColor: AppColor.buttonBackgroundColor,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColor.textColorDark,
      fontFamily: "Segone UI",
      fontSize: 60,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.7,
    ),
    displayMedium: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 60,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.7,
    ),
    displaySmall: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 30,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.7,
    ),
    headlineSmall: TextStyle(
      color: AppColor.textColorDark,
      fontFamily: "Segone UI",
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
    ),
    headlineMedium: TextStyle(
      color: AppColor.textColor,
      fontFamily: "Segone UI",
      fontSize: 20,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.3,
    ),
    labelSmall: TextStyle(
      color: AppColor.textColor.withOpacity(0.7),
      fontSize: 20,
      fontWeight: FontWeight.w200,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    background: AppColor.bodyColorDark,
    brightness: Brightness.light,
    onError: AppColor.error,
  ),
);
