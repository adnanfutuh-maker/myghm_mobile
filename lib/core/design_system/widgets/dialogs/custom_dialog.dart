import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';

class CustomDialog {
  static void show(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required Color color,
    required String buttonText,
    required VoidCallback onPressed,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimension.radius20),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(Dimension.radius24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.2),
                radius: Dimension.radius30,
                child: Icon(icon, size: Dimension.radius36, color: color),
              ),
              SizedBox(height: Dimension.height16),
              Text(
                title,
                style: TextStyles.textLgBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimension.height12),
              Text(
                content,
                style: TextStyle(
                  fontSize: Dimension.style16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimension.height24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.width24,
                    vertical: Dimension.height12,
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: Dimension.style16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
