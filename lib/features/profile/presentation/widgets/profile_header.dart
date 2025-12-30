import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Dimension.height180,
          decoration: const BoxDecoration(color: Pallet.primary),
        ),

        Container(
          margin: EdgeInsets.only(top: Dimension.height130),
          padding: EdgeInsets.only(
            top: Dimension.height60,
            bottom: Dimension.height16,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimension.radius20),
            ),
          ),
          child: Column(
            children: [
              Text('Rizki Adnan Futuh', style: TextStyles.textMdSemiBold),
              Text('00000425.12820', style: TextStyles.textMdSemiBold),
            ],
          ),
        ),

        Positioned(
          top: Dimension.height90,
          left: 0,
          right: 0,
          child: Center(
            child: Stack(
              children: [
                Container(
                  width: Dimension.width90,
                  height: Dimension.height90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Pallet.primary,
                      width: Dimension.width3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: Dimension.style32,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: Dimension.radius14,
                    backgroundColor: Pallet.primary,
                    child: Icon(
                      Icons.edit,
                      size: Dimension.style14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
