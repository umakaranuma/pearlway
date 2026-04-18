import 'package:pearlway/core/theme_data/font.dart';
import 'package:flutter/material.dart';

InputDecorationTheme getInputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.white, // Background color
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0XffD0D5DD)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0XffD0D5DD),
      ), // Border when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ), // Border when focused
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red, width: 2), // Error border
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ), // Focused error border
    ),
    errorStyle: buildTextTheme(
      context,
    ).bodySmall?.copyWith(color: colorScheme.getError(context)),
    hintStyle: buildTextTheme(
      context,
    ).labelSmall!.copyWith(color: colorScheme.getPrimaryBorder(context)),
    constraints: const BoxConstraints(minHeight: 30), // Global height
  );
}
