import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pearlway/core/common_widgets/pearl_badge.dart';
import 'package:pearlway/core/common_widgets/pearl_card.dart';
import 'package:pearlway/core/common_widgets/pearl_pill.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surf,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(context),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: const Text('←', style: TextStyle(fontSize: 20, color: AppColors.ink3)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surf,
                    border: Border.all(color: AppColors.bdr),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Text('🔍', style: TextStyle(color: AppColors.ink4, fontSize: 14)),
                      const SizedBox(width: 8),
                      Text(
                        'Ella, Sri Lanka',
                        style: TextStyle(fontSize: 11.5, color: AppColors.ink),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surf,
                    border: Border.all(color: AppColors.bdr),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('📅 Apr 22–25', style: TextStyle(fontSize: 10.5, color: AppColors.ink2)),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surf,
                    border: Border.all(color: AppColors.bdr),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('👤 2 guests', style: TextStyle(fontSize: 10.5, color: AppColors.ink2)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 28,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PearlPill(label: '🏡 Stays', isSelected: true, onTap: () {}),
                const SizedBox(width: 6),
                PearlPill(label: '🚗 Vehicles', isSelected: false, onTap: () {}),
                const SizedBox(width: 6),
                PearlPill(label: '🗺 Places', isSelected: false, onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('14 stays in Ella', style: TextStyle(fontSize: 10.5, color: AppColors.ink4)),
              Text('⚙ Filter', style: TextStyle(fontSize: 10.5, color: AppColors.teal, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildSearchCard(
                  title: 'Ella Rock Villa',
                  location: 'Ella · 3 beds',
                  price: 'LKR 8,500',
                  rating: '4.9',
                  emoji: '🌿',
                  badgeText: 'Best match',
                ),
                const SizedBox(height: 12),
                _buildSearchCard(
                  title: 'Tea Garden Guesthouse',
                  location: 'Ella · 2 beds',
                  price: 'LKR 4,800',
                  rating: '4.5',
                  emoji: '☕',
                ),
                const SizedBox(height: 12),
                _buildSearchCard(
                  title: 'Mountain View Homestay',
                  location: 'Ella · 1 bed',
                  price: 'LKR 3,200',
                  rating: '4.3',
                  emoji: '🏡',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard({
    required String title,
    required String location,
    required String price,
    required String rating,
    required String emoji,
    String? badgeText,
  }) {
    return PearlCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
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
                Text(emoji, style: const TextStyle(fontSize: 28)),
                if (badgeText != null)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: PearlBadge(text: badgeText, type: BadgeType.amber),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '📍 $location',
                  style: const TextStyle(fontSize: 9.5, color: AppColors.ink4),
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
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.teal,
                            ),
                          ),
                          const TextSpan(
                            text: ' /night',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 9,
                              color: AppColors.ink4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('⭐ $rating', style: const TextStyle(fontSize: 10.5, color: AppColors.ink3)),
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
