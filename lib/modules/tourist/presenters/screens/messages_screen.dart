import 'package:flutter/material.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surf,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
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
                'Mark all read',
                style: TextStyle(
                  fontSize: 10.5,
                  color: AppColors.teal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: AppColors.tealBg,
            child: _buildNotificationItem(
              icon: '✅',
              iconBgColor: AppColors.tealBg,
              title: 'Booking confirmed!',
              subtitle: 'Ella Rock Villa · Apr 22–25 · LKR 27,540',
              time: '2m ago',
            ),
          ),
          _buildNotificationItem(
            icon: '💬',
            iconBgColor: AppColors.amberLt,
            title: 'Message from Sunil',
            subtitle: '"Welcome! I\'ll be at the gate to receive you..."',
            time: '1h ago',
          ),
          _buildNotificationItem(
            icon: '🛺',
            iconBgColor: AppColors.tealBg,
            title: 'Tuk-tuk request pending',
            subtitle: 'Nimal will confirm within 2 hours',
            time: '3h ago',
          ),
          _buildNotificationItem(
            icon: '⭐',
            iconBgColor: AppColors.goldLt,
            title: 'Leave a review',
            subtitle: 'How was your stay at Mirissa Beach Cottage?',
            time: '2d ago',
          ),
          _buildNotificationItem(
            icon: '🎁',
            iconBgColor: const Color(0xFFF0EEFF),
            title: '240 Go Points earned!',
            subtitle: 'Use for discounts on your next booking',
            time: '3d ago',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String time,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: AppColors.bdr)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(icon, style: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 12),
          Expanded(
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
                const SizedBox(height: 1),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: AppColors.ink4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              fontSize: 9.5,
              color: AppColors.ink5,
            ),
          ),
        ],
      ),
    );
  }
}
