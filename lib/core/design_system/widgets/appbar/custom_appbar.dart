import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import '../../themes/pallet.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppbar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Pallet.primary,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,

      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: Dimension.radius23,
        ),
      ),
    );
  }
}
