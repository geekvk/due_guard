import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
class OnboardingOrbitingRingsBackground extends StatefulWidget {
  const OnboardingOrbitingRingsBackground({
    super.key,
    this.loopDuration = const Duration(seconds: 14),
  });

  /// Duration of one full base loop. Individual rings move at multiples of
  /// this so their dots drift in and out of sync rather than all lining up.
  final Duration loopDuration;

  @override
  State<OnboardingOrbitingRingsBackground> createState() =>
      _OnboardingOrbitingRingsBackgroundState();
}

class _OnboardingOrbitingRingsBackgroundState
    extends State<OnboardingOrbitingRingsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.loopDuration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox.expand(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              painter: _RingsPainter(progress: _controller.value),
            );
          },
        ),
      ),
    );
  }
}

class _RingConfig {
  const _RingConfig({
    required this.radiusRatio,
    required this.ringColor,
    required this.dotColor,
    required this.dotRadius,
    required this.speed,
    required this.direction,
    required this.phase,
  });

  /// Ring radius as a fraction of the canvas height (rings are centered on
  /// the bottom-center point, matching onboarding.svg).
  final double radiusRatio;
  final Color ringColor;
  final Color dotColor;
  final double dotRadius;

  /// Multiplier on the base loop speed — >1 is faster, <1 is slower.
  final double speed;

  /// 1 for clockwise, -1 for counter-clockwise.
  final double direction;

  /// Starting offset (0.0–1.0) so dots don't all start aligned.
  final double phase;
}

class _RingsPainter extends CustomPainter {
  _RingsPainter({required this.progress});

  final double progress;

  // Matches the ring radii in onboarding.svg (150/225/300/375/450 out of an
  // 844-tall reference frame), expressed as ratios of canvas height.
  static final List<_RingConfig> _rings = [
    _RingConfig(
      radiusRatio: 150 / 844,
      ringColor: const Color(0xFF2FA86B).withValues(alpha: 0.6),
      dotColor: const Color(0xFF97D9B5),
      dotRadius: 4,
      speed: 1.4,
      direction: 1,
      phase: 0.0,
    ),
    _RingConfig(
      radiusRatio: 225 / 844,
      ringColor: const Color(0xFF1C5C3B).withValues(alpha: 0.7),
      dotColor: const Color(0xFF5FC994),
      dotRadius: 3.5,
      speed: 1.0,
      direction: -1,
      phase: 0.22,
    ),
    _RingConfig(
      radiusRatio: 300 / 844,
      ringColor: const Color(0xFF14422A).withValues(alpha: 0.8),
      dotColor: const Color(0xFF2FA86B),
      dotRadius: 3.5,
      speed: 0.75,
      direction: 1,
      phase: 0.5,
    ),
    _RingConfig(
      radiusRatio: 375 / 844,
      ringColor: const Color(0xFF0F3020).withValues(alpha: 0.9),
      dotColor: const Color(0xFF1F6E48),
      dotRadius: 3,
      speed: 0.55,
      direction: -1,
      phase: 0.7,
    ),
    _RingConfig(
      radiusRatio: 450 / 844,
      ringColor: const Color(0xFF081810),
      dotColor: const Color(0xFF14422A),
      dotRadius: 3,
      speed: 0.4,
      direction: 1,
      phase: 0.85,
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);

    _paintGlowFill(canvas, size, center);

    for (final ring in _rings) {
      final radius = ring.radiusRatio * size.height;

      // Static ring outline.
      final ringPaint = Paint()
        ..color = ring.ringColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(center, radius, ringPaint);

      // Orbiting dot position.
      final t = (progress * ring.speed * ring.direction + ring.phase) % 1.0;
      final angle = t * 2 * math.pi;
      final dotCenter = center + Offset(
        radius * math.cos(angle),
        radius * math.sin(angle),
      );

      // Soft glow halo behind the dot.
      final glowPaint = Paint()
        ..color = ring.dotColor.withValues(alpha: 0.55)
        ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 8);
      canvas.drawCircle(dotCenter, ring.dotRadius * 2.4, glowPaint);

      // Crisp dot core.
      final corePaint = Paint()..color = ring.dotColor;
      canvas.drawCircle(dotCenter, ring.dotRadius, corePaint);
    }
  }

  /// Recreates the two blurred filled glow shapes from onboarding.svg —
  /// this is what actually shades the bottom of the screen green. Without
  /// this, only the thin ring outlines are visible, which is why the
  /// rendered result looked mostly black.
  void _paintGlowFill(Canvas canvas, Size size, Offset center) {
    // Outer, larger, softer glow — matches the SVG's filter0 blur layer.
    final outerRadius = (395 / 844) * size.height;
    final outerPaint = Paint()
      ..shader = ui.Gradient.radial(
        center,
        outerRadius,
        [
          const Color(0xFF123D28).withValues(alpha: 0.8),
          const Color(0xFF123D28).withValues(alpha: 0.0),
        ],
      )
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 40);
    canvas.drawCircle(center, outerRadius, outerPaint);

    // Inner, brighter, tighter glow — matches the SVG's filter1 blur layer.
    // Same center as the outer glow (both are bottom-centered per the SVG).
    final innerRadius = (125 / 844) * size.height;
    final innerPaint = Paint()
      ..shader = ui.Gradient.radial(
        center,
        innerRadius,
        [
          const Color(0xFF2FA86B).withValues(alpha: 0.55),
          const Color(0xFF2FA86B).withValues(alpha: 0.0),
        ],
      )
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 30);
    canvas.drawCircle(center, innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(covariant _RingsPainter oldDelegate) =>
      oldDelegate.progress != progress;
}