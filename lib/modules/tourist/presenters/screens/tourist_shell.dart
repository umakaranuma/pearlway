import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class TouristShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const TouristShell({
    super.key,
    required this.navigationShell,
  });

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.bdr, width: 1),
          ),
        ),
        padding: const EdgeInsets.only(top: 2, bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Explore', '🏠'),
            _buildNavItem(1, 'Places', '🗺'),
            _buildNavItem(2, 'Trips', '📋'),
            _buildNavItem(3, 'Messages', '💬'),
            _buildNavItem(4, 'Profile', '👤'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String emoji) {
    final bool isSelected = navigationShell.currentIndex == index;
    
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onItemTapped(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 18, height: 1),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.teal : AppColors.ink4,
                  fontFamily: 'Plus Jakarta Sans', // Ensure correct font mapping
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
