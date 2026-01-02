import 'package:flutter/material.dart';

import 'core/design_system/themes/dimension.dart';
import 'core/design_system/themes/pallet.dart';
import 'core/design_system/themes/textstyles.dart';

class AbsenPage extends StatelessWidget {
  const AbsenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Pallet.primary,
        elevation: 0,
        title: Text(
          'MyGHM',
          style: TextStyle(color: Colors.black, fontSize: Dimension.style22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimension.radius16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Aktifitas Terakhir Melakukan Absensi',
              style: TextStyle(color: Colors.grey, fontSize: Dimension.style14),
            ),
            SizedBox(height: Dimension.height4),
            Text(
              'Anda Telah Melakukan Absen Check IN pada: 02 January 2026 07:23:03',
              style: TextStyles.textMdMedium,
            ),
            SizedBox(height: Dimension.height16),
          ],
        ),
      ),
    );
  }
}
