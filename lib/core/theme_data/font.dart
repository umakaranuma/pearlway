import 'package:pearlway/core/theme_data/colour_scheme.dart';
import 'package:flutter/material.dart';

CustomColourScheme colorScheme = CustomColourScheme();

TextTheme buildTextTheme(BuildContext context) {
  return TextTheme(
    //TITLE
    titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: colorScheme.getPrimaryText(context),
    ),
    titleSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: colorScheme.getPrimaryText(context),
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: colorScheme.getPrimaryText(context),
    ),

    //HEADLINE
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: colorScheme.getPrimaryColor(context),
    ),

    //LABEL
    labelLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w500,
      color: colorScheme.getPrimaryText(context),
    ),

    // labelMedium: TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w600,
    //   color: colorScheme.getPrimaryButtonText(context), // Primary button text
    // ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colorScheme.getSecondaryText(context),
    ),

    //DISPLAY
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: colorScheme.getSecondaryText(context),
    ),

    displaySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: colorScheme.getSecondaryText(context),
    ),

    // // BUTTON TEXT STYLES
    // bodyLarge: TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w600,
    //   color: colorScheme.getPrimaryButtonText(context), // Primary button text
    // ),
    // bodyMedium: TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w500,
    //   color: colorScheme.getSecondaryButtonText(context), // Secondary button text
    // ),
    // bodySmall: TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    //   color: colorScheme.getSecondaryText(context),
    // ),
  );
}
