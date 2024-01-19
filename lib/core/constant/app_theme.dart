import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shipoka/app/styles/app_color.dart';

class AppTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData themeData = ThemeData(
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(
        AppColors.primaryColor,
      ),
    ),
    canvasColor: Colors.transparent,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.deepBlue,
    ),
    textTheme: GoogleFonts.ubuntuTextTheme(),
    primarySwatch: const MaterialColor(
      0xffF26520,
      AppColors.colorScratch,
    ),
  );
}