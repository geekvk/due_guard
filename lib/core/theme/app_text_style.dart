// 1. Change this import line:
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyle {
  static const String _fontFamilySans = 'Outfit';

  // Headline styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 57,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 45,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  // Custom app specific styles
  static const TextStyle chipText = TextStyle(
    fontFamily: _fontFamilySans,
    color: AppColors.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static const TextStyle primaryButtonTextStyle = TextStyle(
    fontFamily: _fontFamilySans,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle headerText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: _fontFamilySans,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle descriptionText = TextStyle(
    color: AppColors.descriptionText,
    fontFamily: _fontFamilySans,
    fontSize: 16,
    letterSpacing: 0.5,
  );

  static const TextStyle footerTextStyle = TextStyle(
    color: AppColors.textSecondary,
    fontFamily: _fontFamilySans,
    fontSize: 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w600
  );
  static const TextStyle linkTextStyle = TextStyle(
      color: AppColors.accent,
      fontFamily: _fontFamilySans,
      fontSize: 14,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w600
  );
}
