import 'package:flutter/material.dart';

/// A small floating pill badge with an icon + label, positioned around the
/// central illustration (e.g. "PAID", "DUE SOON", "SECURED").
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

  /// Where the badge sits relative to the illustration stack.
  final Alignment alignment;

  /// Fine-tune the position beyond the base alignment.
  final Offset offset;

  /// If true, the icon renders as a solid colored dot rather than an
  /// outlined icon (matches the "SECURED" badge's plain dot in image 3).
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
            style: const TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

/// The layered "card stack with a center icon and floating badges"
/// illustration used across the onboarding slides.
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
      iconColor: Color(0xFF97C459),
      alignment: Alignment.topRight,
      offset: Offset(6, 6),
    ),
    const OnboardingBadge(
      icon: Icons.notifications,
      label: 'DUE SOON',
      iconColor: Color(0xFFFAC775),
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
      iconColor: Color(0xFFD6674F),
      alignment: Alignment.topLeft,
      offset: Offset(-6, 6),
    ),
    const OnboardingBadge(
      icon: Icons.pie_chart,
      label: 'MIN DUE',
      iconColor: Color(0xFFF5F5F5),
      alignment: Alignment.bottomRight,
      offset: Offset(6, -6),
    ),
  ],
);

/// Slide 3 — "Stay ahead, stress-free": single SECURED badge.
final onboardingIllustrationSlide3 = OnboardingIllustration(
  centerIcon: Icons.shield_rounded,
  badges: [
    const OnboardingBadge(
      icon: Icons.circle,
      label: 'SECURED',
      iconColor: Color(0xFF97C459),
      alignment: Alignment.topRight,
      offset: Offset(6, 6),
      filled: true,
    ),
  ],
);