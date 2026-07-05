import 'package:flutter/material.dart';
abstract final class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Dark mode — base (confirmed)
  // ---------------------------------------------------------------------
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF161616);
  static const Color surfaceElevated = Color(0xFF1C1C1C);
  static const Color border = Color(0xFF2A2A2A);

  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFF8C8C8C);
  static const Color descriptionText = Color(0xFFB8B8B8);
  // ---------------------------------------------------------------------
  // Brand accent — emerald (confirmed)
  // ---------------------------------------------------------------------
  static const Color accent = Color(0xFF2FA86B);
  static const Color accentTintBackground = Color(0xFF123D28);
  static const Color accentTintIcon = Color(0xFF5FC994);

  /// Text/icon color to use when placed on top of a solid [accent] fill.
  static const Color onAccent = Color(0xFF0A2618);

  // ---------------------------------------------------------------------
  // Status system (confirmed) — identical usage everywhere in the app:
  // dashboard, list rows, history, item detail, widgets.
  // ---------------------------------------------------------------------

  /// Fully paid this cycle / installment paid.
  static const Color paid = Color(0xFF97C459);

  /// Due later than 3 days out.
  static const Color upcoming = Color(0xFF6B8CAE);

  /// Due within 1–3 days.
  static const Color dueSoon = Color(0xFFE0A429);
  static const Color dueSoonBackground = Color(0xFF412402);
  static const Color dueSoonText = Color(0xFFFAC775);

  /// Past due date. Deliberately softened/desaturated — never paired with
  /// pulsing/flashing motion.
  static const Color overdue = Color(0xFFD6674F);

  /// Used for destructive actions (e.g. Delete) — same hue as [overdue]
  /// by design, since both represent "needs caution."
  static const Color destructive = Color(0xFFD6674F);

  // ---------------------------------------------------------------------
  // Light mode — NOT YET APPROVED. Placeholder values only; revisit
  // before shipping a light theme.
  // ---------------------------------------------------------------------
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceElevatedLight = Color(0xFFF2F2F2);
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF6B6B6B);
}