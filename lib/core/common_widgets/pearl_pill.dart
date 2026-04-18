import 'package:flutter/material.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class PearlPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PearlPill({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.teal : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.teal : AppColors.bdr2,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.ink2,
          ),
        ),
      ),
    );
  }
}
