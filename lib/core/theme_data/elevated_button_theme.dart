import 'package:flutter/material.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

ElevatedButtonThemeData getElevatedButtonThemeData(BuildContext context) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.bdr;
        }
        if (states.contains(WidgetState.pressed)) {
          return AppColors.tealDk;
        }
        return AppColors.teal; // Primary btn by default
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.ink4;
        }
        return Colors.white;
      }),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Plus Jakarta Sans',
        ),
      ),
      fixedSize: const WidgetStatePropertyAll(
        Size.fromHeight(44),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // --r-md
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 7, horizontal: 14),
      ),
      elevation: const WidgetStatePropertyAll(0),
    ),
  );
}
