import 'package:flutter/material.dart';
import 'package:who_win_the_million/constants/colors/app_colors.dart';

// ------------------------------------
// * App Theme
// ------------------------------------

class AppTheme {
  static ThemeData customTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.appBarColor,
      scaffoldBackgroundColor: AppColors.scaffColor,
    );
  }
}
