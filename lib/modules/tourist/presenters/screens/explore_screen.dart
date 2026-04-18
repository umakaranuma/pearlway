import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pearlway/core/common_widgets/pearl_badge.dart';
import 'package:pearlway/core/common_widgets/pearl_card.dart';
import 'package:pearlway/core/common_widgets/pearl_pill.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
            padding: const EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(
              child: _buildCategories(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            sliver: SliverToBoxAdapter(
              child: _buildFilters(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildStayCard(
                  title: 'Ella Rock Villa',
                  location: 'Ella, Badulla',
                  price: 'LKR 8,500',
                  rating: '4.9',
                  reviews: '124',
                  imageEmoji: '🌿',
                  badge: const PearlBadge(text: 'Top rated', type: BadgeType.amber),
                ),
                const SizedBox(height: 9),
                _buildStayCard(
                  title: 'Mirissa Beach Cottage',
                  location: 'Mirissa, Matara',
                  price: 'LKR 6,200',
                  rating: '4.7',
                  reviews: '89',
                  imageEmoji: '🌊',
                  badge: const PearlBadge(text: 'New', type: BadgeType.teal),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PearlWay',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    'Good morning, Emma 👋',
                    style: TextStyle(
                      fontSize: 10.5,
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text('🔔', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => context.push('/explore/search'),
            child: Container(
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
                  Text('Where in Sri Lanka?', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'BROWSE BY TYPE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.ink2,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 66,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            children: [
              _CategoryItem(icon: '🏡', label: 'Stays', isSelected: true),
              const SizedBox(width: 8),
              _CategoryItem(icon: '🚗', label: 'Vehicles', isSelected: false),
              const SizedBox(width: 8),
              _CategoryItem(icon: '🗺', label: 'Places', isSelected: false),
              const SizedBox(width: 8),
              _CategoryItem(icon: '🎭', label: 'Experiences', isSelected: false),
              const SizedBox(width: 8),
              _CategoryItem(icon: '🧭', label: 'Guides', isSelected: false),
            ],
          ),
        ),
      ],
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
          PearlPill(label: 'Ella', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: 'Mirissa', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: 'Kandy', isSelected: false, onTap: () {}),
          const SizedBox(width: 6),
          PearlPill(label: 'Colombo', isSelected: false, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildStayCard({
    required String title,
    required String location,
    required String price,
    required String rating,
    required String reviews,
    required String imageEmoji,
    required Widget badge,
  }) {
    return PearlCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.tealBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(imageEmoji, style: const TextStyle(fontSize: 32)),
                Positioned(
                  top: 7,
                  left: 7,
                  child: badge,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
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
                  '📍 $location',
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: AppColors.ink4,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              fontFamily: 'Playfair Display',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.teal,
                            ),
                          ),
                          const TextSpan(
                            text: ' /night',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: AppColors.ink4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '⭐ $rating ',
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: AppColors.ink3,
                            ),
                          ),
                          TextSpan(
                            text: '($reviews)',
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: AppColors.ink5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.teal : AppColors.tealBg,
            borderRadius: BorderRadius.circular(13),
          ),
          alignment: Alignment.center,
          child: Text(icon, style: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 9.5,
            color: AppColors.ink3,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
