import 'package:flutter/material.dart';

import 'app_colors.dart';
class AppTheme {
  AppTheme._();

  static const double _radiusSm = 10;
  static const double _radiusMd = 14;
  static const double _radiusLg = 16;
  static const double _radiusXl = 20;

  // ---------------------------------------------------------------------
  // Dark theme (primary, confirmed palette)
  // ---------------------------------------------------------------------
  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark(
      surface: AppColors.background,
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      secondary: AppColors.accentTintIcon,
      onSecondary: AppColors.onAccent,
      error: AppColors.overdue,
      onError: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
    );

    final textTheme = _buildTextTheme(
      primary: AppColors.textPrimary,
      secondary: AppColors.textSecondary,
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: 'Inter', // swap for the confirmed brand typeface if different
      dividerColor: AppColors.border,
      splashColor: AppColors.accent.withValues(alpha: 0.12),
      highlightColor: Colors.transparent,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiusLg),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          disabledBackgroundColor: AppColors.surfaceElevated,
          disabledForegroundColor: AppColors.textSecondary,
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radiusMd),
          ),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border, width: 1),
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radiusMd),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 20),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceElevated,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: const BorderSide(color: AppColors.overdue, width: 1),
        ),
        errorStyle: const TextStyle(color: AppColors.overdue, fontSize: 12),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF141414),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(_radiusXl)),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        elevation: 2,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? AppColors.onAccent
              : AppColors.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? AppColors.accent
              : AppColors.surfaceElevated,
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accent,
        linearTrackColor: AppColors.border,
        circularTrackColor: AppColors.border,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiusLg),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceElevated,
        selectedColor: AppColors.accentTintBackground,
        labelStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
        secondaryLabelStyle: const TextStyle(color: AppColors.accentTintIcon, fontSize: 12),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiusSm),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Light theme — PLACEHOLDER, unapproved colors. Do not ship as final.
  // ---------------------------------------------------------------------
  static ThemeData get lightTheme {
    const colorScheme = ColorScheme.light(
      surface: AppColors.backgroundLight,
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      secondary: AppColors.accentTintIcon,
      onSecondary: AppColors.onAccent,
      error: AppColors.overdue,
      onError: Colors.white,
      onSurface: AppColors.textPrimaryLight,
    );

    final textTheme = _buildTextTheme(
      primary: AppColors.textPrimaryLight,
      secondary: AppColors.textSecondaryLight,
    );

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: 'Inter',
      dividerColor: AppColors.borderLight,
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiusLg),
          side: const BorderSide(color: AppColors.borderLight, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radiusMd),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Shared text scale
  // ---------------------------------------------------------------------
  static TextTheme _buildTextTheme({
    required Color primary,
    required Color secondary,
  }) {
    return TextTheme(
      // Heaviest tier — currency amounts, hero figures (e.g. "$1,284.50").
      displayLarge: TextStyle(
        color: primary,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: primary,
        fontSize: 26,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),

      // Headlines / screen titles.
      headlineSmall: TextStyle(
        color: primary,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),

      // Card/row titles, primary labels.
      titleMedium: TextStyle(
        color: primary,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: primary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      // Body copy.
      bodyLarge: TextStyle(color: primary, fontSize: 14, height: 1.4),
      bodyMedium: TextStyle(color: secondary, fontSize: 13, height: 1.4),

      // Metadata tier — smallest, always secondary color.
      labelMedium: TextStyle(color: secondary, fontSize: 12),
      labelSmall: TextStyle(color: secondary, fontSize: 11),
    );
  }
}