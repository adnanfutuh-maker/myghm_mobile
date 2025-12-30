import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';
import 'package:myghm_mobile/features/salary_slip/presentation/widgets/slip_card.dart';

class SalarySlipPage extends StatelessWidget {
  const SalarySlipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final slips = ['November 2025', 'Oktober 2025', 'September 2025'];

    return Scaffold(
      backgroundColor: Pallet.primaryScBg,
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
            Text('Data Slip Gaji', style: TextStyles.textMdBold),
            SizedBox(height: Dimension.height4),
            Text(
              'Data hanya tersedia 3 bulan terakhir',
              style: TextStyle(color: Colors.grey, fontSize: Dimension.style12),
            ),
            SizedBox(height: Dimension.height16),

            Expanded(
              child: ListView.separated(
                itemCount: slips.length,
                separatorBuilder: (_, _) =>
                    SizedBox(height: Dimension.height12),
                itemBuilder: (context, index) {
                  return SlipCard(month: slips[index], onDownload: () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
