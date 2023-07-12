import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// AppTheme is used to store all the styles used in the app in one place
// This makes it easier to change the style scheme of the app
// The styles are stored as functions
// The styles are used as appTheme().styleName
// To use the styles just write  style: appTheme().textTheme.headline2

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const AppColors().white,
    fontFamily: 'Inter',
    textTheme: TextTheme(
        headlineLarge: GoogleFonts.jost(
            fontSize: 60.0, fontWeight: FontWeight.w600, color: Colors.white),
        displayLarge: GoogleFonts.jost(
            fontSize: 40.0, fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: GoogleFonts.jost(
            fontSize: 36.0, fontWeight: FontWeight.w600, color: Colors.white),
        headlineMedium: GoogleFonts.jost(
            fontSize: 32.0, fontWeight: FontWeight.w600, color: Colors.white),
        displayMedium: GoogleFonts.jost(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
        bodyMedium: GoogleFonts.jost(
            fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
        headlineSmall: GoogleFonts.jost(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: GoogleFonts.jost(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
  );
}
