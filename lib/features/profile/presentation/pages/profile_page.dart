import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.primaryScBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),

            SizedBox(height: Dimension.height12),

            ProfileMenuItem(
              icon: Icons.person_outline,
              title: 'Data Pribadi',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.family_restroom_outlined,
              title: 'Data Keluarga',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.health_and_safety_outlined,
              title: 'Data BPJS',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.lock_reset,
              title: 'Reset Password',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.account_balance_outlined,
              title: 'Data Bank',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.description_outlined,
              title: 'Upload KK',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.receipt_long_outlined,
              title: 'Upload NPWP',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.credit_card_outlined,
              title: 'Data Jenis Kartu',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.badge_outlined,
              title: 'Kartu ID Card',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.assignment_outlined,
              title: 'SPT',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.info_outline,
              title: 'Tentang Aplikasi',
              onTap: () {},
            ),
            SizedBox(height: Dimension.height12),
          ],
        ),
      ),
    );
  }
}
