import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText = 'COBA LAGI',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 40,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              message,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
