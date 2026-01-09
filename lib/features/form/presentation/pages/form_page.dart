import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/widgets/appbar/custom_appbar.dart';
import 'package:myghm_mobile/features/form/presentation/widgets/menu_card_form.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: CustomAppbar(title: "MyGHM"),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          MenuCardForm(
            icon: Icons.fingerprint,
            label: 'Absen',
            color: Color(0xFF3B82F6),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.article_rounded,
            label: 'Report',
            color: Color(0xFF1E40AF),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.timer_rounded,
            label: 'Lembur',
            color: Color(0xFF8B5CF6),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.event_rounded,
            label: 'Cuti',
            color: Color(0xFF22C55E),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.assignment_ind_rounded,
            label: 'Izin',
            color: Color(0xFFF97316),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.sick_rounded,
            label: 'Sakit',
            color: Color(0xFFF43F5E),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.chat_rounded,
            label: 'Chat',
            color: Color(0xFF06B6D4),
            onTap: () {},
          ),
          MenuCardForm(
            icon: Icons.phonelink_rounded,
            label: 'Ganti Hp',
            color: Color(0XFFEC4899),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
