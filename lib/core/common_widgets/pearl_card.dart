import 'package:flutter/material.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class PearlCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const PearlCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18), // --r-lg
          border: Border.all(color: AppColors.bdr),
        ),
        child: child,
      ),
    );
  }
}
