import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';

import '../../../../core/design_system/widgets/appbar/custom_appbar.dart'
    show CustomAppbar;

class BankDataPage extends StatelessWidget {
  const BankDataPage({super.key});

  static const _bgColor = Color(0xFFF5F6FA);
  static const _borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: CustomAppbar(
        title: "Data Bank",
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: Dimension.radius36),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(Dimension.radius16),
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: Dimension.height16),
                Image.asset(
                  'assets/icon/icon.png',
                  height: Dimension.height60,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: Dimension.height24),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(Dimension.radius16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimension.radius16),
              border: Border.all(color: _borderColor),
            ),
            child: Column(
              children: const [
                _RowItem(label: 'Nama Bank', value: 'BANK BCA'),
                _RowItem(label: 'Nama di Rekening', value: 'RIZKI ADNAN FUTUH'),
                _RowItem(label: 'No. Rekening', value: '5776675756'),
              ],
            ),
          ),

          SizedBox(height: Dimension.height24),

          Text(
            'Untuk kesalahan No. Rekening, silahkan menghubungi Project Leader '
            'dengan menyertakan buku rekening bank yang benar.',
            style: TextStyle(
              fontSize: Dimension.style12,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final String label;
  final String value;

  const _RowItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimension.height8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontSize: Dimension.style13, color: Colors.grey),
            ),
          ),
          const Text(' :  '),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: Dimension.style14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
