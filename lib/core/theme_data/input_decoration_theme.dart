import 'package:pearlway/core/theme_data/colour_scheme.dart';
import 'package:flutter/material.dart';

InputDecorationTheme getInputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white, 
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    hintStyle: const TextStyle(
      color: AppColors.ink4,
      fontSize: 12.5,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), // --r-md
      borderSide: const BorderSide(color: AppColors.bdr2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.bdr2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.teal, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red, width: 1.5), 
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red, width: 1.5), 
    ),
    constraints: const BoxConstraints(minHeight: 40),
  );
}
