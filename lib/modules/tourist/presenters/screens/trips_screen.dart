import 'package:flutter/material.dart';
import 'package:pearlway/core/common_widgets/pearl_badge.dart';
import 'package:pearlway/core/common_widgets/pearl_button.dart';
import 'package:pearlway/core/common_widgets/pearl_pill.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surf,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'My trips',
          style: TextStyle(
            fontFamily: 'Playfair Display',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Center(
              child: Text(
                '2 upcoming · 5 done',
                style: TextStyle(fontSize: 10.5, color: AppColors.ink4),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                PearlPill(label: '📅 Upcoming', isSelected: true, onTap: () {}),
                const SizedBox(width: 6),
                PearlPill(label: '✅ Past', isSelected: false, onTap: () {}),
                const SizedBox(width: 6),
                PearlPill(label: '❌ Cancelled', isSelected: false, onTap: () {}),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _buildTripCard(
                    title: 'Ella Rock Villa',
                    dates: 'Apr 22–25 · 3 nights',
                    emoji: '🌿',
                    total: 'LKR 27,540',
                    badge: const PearlBadge(text: 'CONFIRMED', type: BadgeType.green),
                    buttonText: 'View details',
                  ),
                  const SizedBox(height: 12),
                  _buildTripCard(
                    title: 'Tuk-tuk — Nimal',
                    dates: 'Apr 23 · Full day',
                    emoji: '🛺',
                    total: 'LKR 2,200',
                    badge: const PearlBadge(text: 'PENDING', type: BadgeType.amber),
                    buttonText: 'Manage',
                    isGhost: true,
                  ),
                  const SizedBox(height: 12),
                  Opacity(
                    opacity: 0.6,
                    child: _buildTripCard(
                      title: 'Whale watching tour',
                      dates: 'Apr 24 · 8:00 AM',
                      emoji: '🐋',
                      total: 'LKR 4,500',
                      badge: const PearlBadge(text: 'BOOKED', type: BadgeType.teal),
                      buttonText: 'Details',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripCard({
    required String title,
    required String dates,
    required String emoji,
    required String total,
    required Widget badge,
    required String buttonText,
    bool isGhost = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bdr),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Column(
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
                      Text(
                        dates,
                        style: const TextStyle(
                          fontSize: 10.5,
                          color: AppColors.ink4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              badge,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 11.5,
                        color: AppColors.ink3,
                      ),
                    ),
                    TextSpan(
                      text: total,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
                child: PearlButton(
                  text: buttonText,
                  isGhost: isGhost,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
