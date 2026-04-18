import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pearlway/core/theme_data/app_bar_theme.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';
import 'package:pearlway/core/theme_data/elevated_button_theme.dart';
import 'package:pearlway/core/theme_data/input_decoration_theme.dart';
import 'package:pearlway/core/theme_data/font.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.surf,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        primary: AppColors.teal,
        secondary: AppColors.amber,
        surface: AppColors.surf,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.ink,
        onError: AppColors.white,
      ),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      textTheme: buildTextTheme(context),
      elevatedButtonTheme: getElevatedButtonThemeData(context),
      inputDecorationTheme: getInputDecorationTheme(context),
      appBarTheme: appBarTheme(context),
      
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.teal; 
          }
          return AppColors.bdr2;
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return Colors.white;
        }),
        trackOutlineWidth: const WidgetStatePropertyAll(0.0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
      ),
    );
  }
}
