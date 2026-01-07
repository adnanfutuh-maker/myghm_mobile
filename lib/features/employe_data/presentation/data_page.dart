import 'package:flutter/material.dart';

import '../../../core/design_system/themes/dimension.dart';
import '../../../core/design_system/themes/pallet.dart';
import '../../../core/design_system/themes/textstyles.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

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
      body: Center(
        child: Text("Data dataan", style: TextStyles.text2XlSemiBold),
      ),
    );
  }
}
