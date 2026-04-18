import 'package:flutter/material.dart';
import 'package:pearlway/core/common_widgets/pearl_pill.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surf,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeroHeader(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 14, bottom: 8),
            sliver: SliverToBoxAdapter(
              child: _buildFilters(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSpotCard(
                  title: 'Ella Rock',
                  icon: '🏔',
                  distance: '📍 1.8 km · 3h hike',
                  entryInfo: 'Free entry · Open daily',
                  rating: '4.9',
                ),
                _buildSpotCard(
                  title: 'Nine Arches Bridge',
                  icon: '🌉',
                  distance: '📍 2.4 km · 10 min',
                  entryInfo: 'Free entry · Best 6–8 AM',
                  rating: '4.8',
                ),
                _buildSpotCard(
                  title: 'Tea Factory Tour',
                  icon: '🍃',
                  distance: '📍 5.1 km · 1.5h guided',
                  entryInfo: 'LKR 500/person · Book ahead',
                  rating: '4.6',
                ),
                _buildSpotCard(
                  title: 'Ravana Falls',
                  icon: '🌊',
                  distance: '📍 7.2 km · 15 min drive',
                  entryInfo: 'LKR 250 · Open 6AM–6PM',
                  rating: '4.7',
                ),
                _buildSpotCard(
                  title: 'Udawalawe Safari',
                  icon: '🐘',
                  distance: '📍 62 km · Full day',
                  entryInfo: 'LKR 4,500 · Book ahead',
                  rating: '4.9',
                ),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 54, left: 14, right: 14, bottom: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.tealDk, AppColors.teal],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tourist places',
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            'Ella area · 28 spots',
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text('🔍', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11.5)),
                const SizedBox(width: 8),
                Text('Search tourist spots...', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          PearlPill(label: 'All', isSelected: true, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: '🏔 Nature', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: '🏛 Culture', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: '🍽 Food', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: '🎭 Activities', isSelected: false, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSpotCard({
    required String title,
    required String icon,
    required String distance,
    required String entryInfo,
    required String rating,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.bdr)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.tealBg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(icon, style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  distance,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: AppColors.ink3,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  entryInfo,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: AppColors.ink4,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '⭐ $rating',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
