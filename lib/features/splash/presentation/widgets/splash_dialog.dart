import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/design_system/widgets/dialogs/custom_dialog.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';

class SplashDialog {
  static void noInternet(BuildContext context) {
    CustomDialog.show(
      context,
      title: 'Tidak Ada Internet',
      content: 'Periksa koneksi internet kamu lalu coba lagi.',
      icon: Icons.wifi_off,
      color: Colors.redAccent,
      buttonText: 'Coba Lagi',
      onPressed: () {
        Navigator.of(context).pop();
        context.read<SplashBloc>().add(const SplashEvent.started());
      },
    );
  }

  static void serverDown(BuildContext context) {
    CustomDialog.show(
      context,
      title: 'Server Tidak Aktif',
      content: 'Koneksi ke server sedang tidak aktif. Silakan coba lagi nanti.',
      icon: Icons.cloud_off,
      color: Colors.orangeAccent,
      buttonText: 'Coba Lagi',
      onPressed: () {
        Navigator.of(context).pop();
        context.read<SplashBloc>().add(const SplashEvent.started());
      },
    );
  }

  static void locationPermission(BuildContext context) {
    CustomDialog.show(
      context,
      title: 'Izin Lokasi Diperlukan',
      content:
          'Aplikasi membutuhkan izin lokasi. Silakan aktifkan lokasi di pengaturan.',
      icon: Icons.location_off,
      color: Colors.blueAccent,
      buttonText: 'Buka Pengaturan',
      onPressed: () async {
        Navigator.of(context).pop();
        await Geolocator.openAppSettings();
        if (!context.mounted) return;
        context.read<SplashBloc>().add(const SplashEvent.started());
      },
    );
  }

  static void updateApp(BuildContext context) {
    CustomDialog.show(
      context,
      title: 'Update Aplikasi Diperlukan',
      content:
          'Versi aplikasi kamu sudah kadaluarsa. Silakan update aplikasi untuk melanjutkan.',
      icon: Icons.system_update,
      color: Colors.green,
      buttonText: 'Update Sekarang',
      onPressed: () async {
        Navigator.of(context).pop();
        const url =
            'https://play.google.com/store/apps/details?id=id.co.humanindo.apps';
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url, mode: LaunchMode.externalApplication);
        }
      },
      barrierDismissible: false,
    );
  }

  static void genericError(BuildContext context, String message) {
    CustomDialog.show(
      context,
      title: 'Terjadi Kesalahan',
      content: message,
      icon: Icons.error_outline,
      color: Colors.purpleAccent,
      buttonText: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
