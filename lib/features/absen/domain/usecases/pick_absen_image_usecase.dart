import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/device/image_picker_device.dart';
import '../../../../core/exceptions/app_exception.dart';

@lazySingleton
class PickAbsenImageUsecase {
  final ImagePickerDevice device;

  PickAbsenImageUsecase(this.device);

  Future<File?> fromCamera() async {
    try {
      return await device.pickFromCamera();
    } catch (_) {
      throw const DefaultAppException(
        code: 'CAMERA_PICK_ERROR',
        message: 'Gagal mengambil foto dari kamera',
      );
    }
  }
}
