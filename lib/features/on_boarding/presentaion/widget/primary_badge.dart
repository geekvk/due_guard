import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_text_style.dart';

class PrimaryBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  final Alignment alignment;
  final Offset offset;
  final bool filled;

  const PrimaryBadge({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    this.alignment = Alignment.center,
    this.offset = Offset.zero,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
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
