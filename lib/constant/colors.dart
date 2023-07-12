import 'package:flutter/material.dart';

// Appcolors are used to store all the colors used in the app in one place
// This makes it easier to change the color scheme of the app
// The colors are stored as final variables
// The colors are used as AppColors.colors.colorName

@immutable
class AppColors {
  static const colors = AppColors();
  final black = const Color(0xFF000000);
  final green = const Color(0xFFACF7A6);
  final white = const Color(0xFFFFFFFF);
  final red = const Color(0xFFF39197);
  final yellow = const Color(0xFFF7EAA6);
  final blue = const Color(0xFFA6E3F7);
  final background = const Color(0xFF292929);
  final strokeLine = const Color(0xFF656565);
  final popUpBackground = const Color(0xFF343434);
  final tileBackground = const Color(0xFF313234);
  final buttonBackground = const Color(0xFF434343);
  final faintText = const Color(0xFF615E5E);
  const AppColors();
}
