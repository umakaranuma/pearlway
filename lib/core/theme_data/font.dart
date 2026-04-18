import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

TextTheme buildTextTheme(BuildContext context) {
  final baseTheme = GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme);
  final displayTheme = GoogleFonts.playfairDisplayTextTheme();
  
  return baseTheme.copyWith(
    // TITLE / DISPLAY (Serif)
    displayLarge: displayTheme.displayLarge?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: displayTheme.displayMedium?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: displayTheme.displaySmall?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    
    // HEADLINE (Sans)
    headlineLarge: baseTheme.headlineLarge?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: baseTheme.headlineMedium?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: baseTheme.headlineSmall?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w600,
    ),

    // TITLES (Sans)
    titleLarge: baseTheme.titleLarge?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: baseTheme.titleMedium?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: baseTheme.titleSmall?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w600,
    ),

    // BODY (Sans)
    bodyLarge: baseTheme.bodyLarge?.copyWith(
      color: AppColors.ink2,
    ),
    bodyMedium: baseTheme.bodyMedium?.copyWith(
      color: AppColors.ink2,
    ),
    bodySmall: baseTheme.bodySmall?.copyWith(
      color: AppColors.ink3,
    ),

    // LABELS / UI (Sans)
    labelLarge: baseTheme.labelLarge?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelMedium: baseTheme.labelMedium?.copyWith(
      color: AppColors.ink3,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelSmall: baseTheme.labelSmall?.copyWith(
      color: AppColors.ink4,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0, // Represents uppercase labels like .slbl (0.06em)
    ),
  );
}
