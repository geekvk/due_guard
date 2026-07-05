import 'package:due_guard/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class OnboardingBadge {
  const OnboardingBadge({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.alignment,
    this.offset = Offset.zero,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final Color iconColor;

  final Alignment alignment;
  final Offset offset;
  final bool filled;

  Widget build() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (filled)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
            )
          else
            Icon(icon, size: 8, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyle.chipText
          ),
        ],
      ),
    );
  }
}

class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({
    super.key,
    required this.centerIcon,
    required this.badges,
    this.size = 220,
  });

  final IconData centerIcon;
  final List<OnboardingBadge> badges;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Layered rounded-square stack, largest/dimmest to
          // smallest/brightest, staggered diagonally.
          Positioned(
            child: Transform.translate(
              offset: const Offset(14, 14),
              child: _blobLayer(size * 0.75, const Color(0xFF0F3020)),
            ),
          ),
          Positioned(
            child: Transform.translate(
              offset: const Offset(6, 6),
              child: _blobLayer(size * 0.62, const Color(0xFF14422A)),
            ),
          ),
          _blobLayer(size * 0.48, const Color(0xFF1C5C3B), border: true),

          // Center icon container.
          Container(
            width: size * 0.28,
            height: size * 0.28,
            decoration: BoxDecoration(
              color: const Color(0xFF123D28),
              borderRadius: BorderRadius.circular(size * 0.09),
              border: Border.all(color: const Color(0xFF2FA86B), width: 1),
            ),
            child: Icon(centerIcon, size: size * 0.14, color: const Color(0xFF5FC994)),
          ),

          // Floating badges, positioned around the stack.
          for (final badge in badges)
            Align(
              alignment: badge.alignment,
              child: Transform.translate(
                offset: badge.offset,
                child: badge.build(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _blobLayer(double side, Color color, {bool border = false}) {
    return Container(
      width: side,
      height: side,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(side * 0.22),
        border: border ? Border.all(color: const Color(0xFF2FA86B).withValues(alpha: 0.4)) : null,
      ),
    );
  }
}

// ---------------------------------------------------------------------
// The three onboarding slide illustrations, matching the reference images.
// ---------------------------------------------------------------------

/// Slide 1 — "Never miss a payment again": PAID + DUE SOON badges.
final onboardingIllustrationSlide1 = OnboardingIllustration(
  centerIcon: Icons.calendar_today_rounded,
  badges: [
    const OnboardingBadge(
      icon: Icons.check_circle,
      label: 'PAID',
      iconColor: AppColors.paid,
      alignment: Alignment.topRight,
      offset: Offset(6, 6),
    ),
    const OnboardingBadge(
      icon: Icons.notifications,
      label: 'DUE SOON',
      iconColor: AppColors.dueSoonText,
      alignment: Alignment.bottomLeft,
      offset: Offset(-6, -6),
    ),
  ],
);

/// Slide 2 — "Know exactly what you owe": INTEREST + MIN DUE badges.
final onboardingIllustrationSlide2 = OnboardingIllustration(
  centerIcon: Icons.calculate_rounded,
  badges: [
    const OnboardingBadge(
      icon: Icons.trending_up,
      label: 'INTEREST',
      iconColor: AppColors.overdue,
      alignment: Alignment.topLeft,
      offset: Offset(-6, 6),
    ),
    const OnboardingBadge(
      icon: Icons.pie_chart,
      label: 'MIN DUE',
      iconColor: AppColors.textPrimary,
      alignment: Alignment.bottomRight,
      offset: Offset(6, -6),
    ),
  ],
);

/// Slide 3 — "Stay ahead, stress-free": single SECURED badge.
final onboardingIllustrationSlide3 = OnboardingIllustration(
  centerIcon: Icons.verified_user,
  badges: [
    const OnboardingBadge(
      icon: Icons.circle,
      label: 'SECURED',
      iconColor: AppColors.paid,
      alignment: Alignment.topRight,
      offset: Offset(6, 6),
      filled: true,
    ),
  ],
);