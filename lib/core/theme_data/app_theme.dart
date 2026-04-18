import 'package:pearlway/core/theme_data/app_bar_theme.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';
import 'package:pearlway/core/theme_data/elevated_button_theme.dart';
import 'package:pearlway/core/theme_data/input_decoration_theme.dart';
import 'package:pearlway/core/theme_data/font.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final CustomColourScheme colorScheme = CustomColourScheme();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      // colorScheme: lightColorScheme, // Make sure you define this
      fontFamily: 'Poppins',
      // Font Themes with context
      textTheme: buildTextTheme(context),
      elevatedButtonTheme: getElevatedButtonThemeData(context),
      inputDecorationTheme: getInputDecorationTheme(context),
      appBarTheme: appBarTheme(context),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(
              255,
              237,
              28,
              36,
            ); // Track color when ON
          }
          return Colors.white;
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // Thumb color when ON
          }
          return const Color(0XffD0D5DD); // Thumb color when OFF
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.blue.withValues(alpha: 0.3); // Ripple effect when pressed
          }
          return null;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent; // No outline when ON
          }
          return const Color(0XffD0D5DD); // Outline when OFF
        }),
        trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return 0.0; // No border when ON
          }
          return 1.0; // Custom border thickness when OFF
        }),
        materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // Reduce padding
      ),
    );
  }
}
