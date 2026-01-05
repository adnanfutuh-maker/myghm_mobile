import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/device/face_detection/face_detection_device.dart';
import '../../../../core/exceptions/app_exception.dart';

@lazySingleton
class ValidateFaceUsecase {
  final FaceDetectionDevice device;

  ValidateFaceUsecase(this.device);

  Future<void> call(File image) async {
    final faces = await device.detectFace(image);

    if (faces.isEmpty) {
      throw const DefaultAppException(
        code: 'NO_FACE_DETECTED',
        message: 'Wajah tidak terdeteksi, pastikan wajah terlihat jelas',
      );
    }

    if (faces.length > 1) {
      throw const DefaultAppException(
        code: 'MULTIPLE_FACE_DETECTED',
        message: 'Terdeteksi lebih dari satu wajah',
      );
    }
  }
}
