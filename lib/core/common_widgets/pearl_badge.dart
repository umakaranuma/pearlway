import 'package:flutter/material.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

enum BadgeType { teal, amber, green, red, gray, gold, purple, white }

class PearlBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final Widget? icon;

  const PearlBadge({
    super.key,
    required this.text,
    this.type = BadgeType.teal,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (type) {
      case BadgeType.teal:
        bgColor = AppColors.tealBg;
        textColor = AppColors.tealDk;
        break;
      case BadgeType.amber:
        bgColor = AppColors.amberLt;
        textColor = AppColors.amberDk;
        break;
      case BadgeType.green:
        bgColor = const Color(0xFFE8F8EE);
        textColor = const Color(0xFF1A6B3A);
        break;
      case BadgeType.red:
        bgColor = const Color(0xFFFDECEA);
        textColor = const Color(0xFF9B2335);
        break;
      case BadgeType.gray:
        bgColor = AppColors.surf;
        textColor = AppColors.ink3;
        break;
      case BadgeType.gold:
        bgColor = AppColors.goldLt;
        textColor = const Color(0xFF8A6500);
        break;
      case BadgeType.purple:
        bgColor = const Color(0xFFF0EEFF);
        textColor = const Color(0xFF4A3AAA);
        break;
      case BadgeType.white:
        bgColor = Colors.white.withValues(alpha: 0.2);
        textColor = Colors.white;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 3),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
