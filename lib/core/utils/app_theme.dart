import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.white,
      hintStyle: AppStyles.normal16black.copyWith(color: AppColor.grey),
      suffixIconColor: AppColor.grey,
      prefixIconColor: AppColor.white,
      border: textInputBorder(),
      focusedBorder: textInputBorder(),
      enabledBorder: textInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(

        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.white,
            textStyle: AppStyles.normal20white,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
  );



  static OutlineInputBorder textInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide());
  }
}
