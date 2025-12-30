import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';

class SlipCard extends StatelessWidget {
  final String month;
  final VoidCallback onDownload;

  const SlipCard({super.key, required this.month, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.radius16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(Dimension.radius16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: Dimension.width44,
            height: Dimension.height44,
            decoration: BoxDecoration(
              color: Pallet.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(Dimension.radius12),
            ),
            child: Icon(
              Icons.description_outlined,
              color: Pallet.primary,
              size: Dimension.radius28,
            ),
          ),
          SizedBox(width: Dimension.width12),

          Expanded(
            child: Text(
              month,
              style: TextStyle(
                fontSize: Dimension.style16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimension.radius16),
            child: InkWell(
              borderRadius: BorderRadius.circular(Dimension.radius16),
              onTap: onDownload,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.download_rounded,
                  color: Colors.grey,
                  size: Dimension.radius28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
