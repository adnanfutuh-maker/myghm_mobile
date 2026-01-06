import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myghm_mobile/features/auth/register/presentation/bloc/register_bloc.dart';

import '../../../../../core/design_system/widgets/dialogs/custom_dialog.dart';
import '../bloc/register_event.dart';

class RegisterDialog {
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
        context.read<RegisterBloc>().add(const RegisterEvent.started());
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
        context.read<RegisterBloc>().add(const RegisterEvent.started());
      },
    );
  }

  static void dataNotFound(BuildContext context) {
    CustomDialog.show(
      context,
      title: 'Data Karyawan Tidak Terdaftar',
      content: 'NIP atau Email yang kamu masukkan tidak terdaftar.',
      icon: Icons.badge_outlined,
      color: Colors.redAccent,
      buttonText: 'Oke',
      onPressed: () {
        Navigator.of(context).pop();
        context.read<RegisterBloc>().add(const RegisterEvent.started());
      },
    );
  }
}
