import 'package:flutter/material.dart';

import 'core/design_system/themes/textstyles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Home  sssssssssss", style: TextStyles.text2XlSemiBold),
      ),
    );
  }
}
