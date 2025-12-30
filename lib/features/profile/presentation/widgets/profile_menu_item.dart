import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.width16,
        vertical: Dimension.height4,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.radius12),
        child: InkWell(
          borderRadius: BorderRadius.circular(Dimension.radius12),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Dimension.radius16),
            child: Row(
              children: [
                Icon(icon, color: Pallet.primary, size: Dimension.radius28),
                SizedBox(width: Dimension.width12),
                Expanded(child: Text(title, style: TextStyles.textSmMedium)),
                Icon(Icons.chevron_right, size: Dimension.radius28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
