import 'package:flutter/material.dart';
import 'package:pearlway/core/common_widgets/pearl_button.dart';
import 'package:pearlway/core/theme_data/colour_scheme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surf,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildProfileHeader(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(14),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow(),
                  const SizedBox(height: 18),
                  
                  const Text(
                    'ACCOUNT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink2,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildListRow('✏️', 'Edit profile'),
                  _buildListRow('🔔', 'Notifications'),
                  _buildListRow('💳', 'Payment methods'),
                  _buildListRow('🌐', 'Language: English'),
                  _buildListRow('💰', 'Currency: LKR'),
                  
                  const SizedBox(height: 20),
                  const Text(
                    'BECOME A HOST',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink2,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildHostCard(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 20, left: 14, right: 14),
      decoration: const BoxDecoration(
        color: AppColors.teal,
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text('👩', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Emma Wilson',
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Joined January 2026 · 7 trips',
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatBox('7', 'Trips', AppColors.tealBg, AppColors.teal),
        const SizedBox(width: 8),
        _buildStatBox('3', 'Reviews', AppColors.amberLt, AppColors.amberDk),
        const SizedBox(width: 8),
        _buildStatBox('240', 'Go points', AppColors.goldLt, const Color(0xFF8A6500)),
      ],
    );
  }

  Widget _buildStatBox(String value, String label, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 9.5,
                color: AppColors.ink4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListRow(String icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.bdr)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const Text(
            '›',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.ink4,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHostCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.tealBg,
        borderRadius: BorderRadius.circular(12), // --r-md
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'List your guesthouse, vehicle or experience on PearlWay and start earning.',
            style: TextStyle(
              fontSize: 11.5,
              color: AppColors.tealDk,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 32,
            child: PearlButton(
              text: 'Get started →',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
