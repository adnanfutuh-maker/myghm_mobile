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
      throw FaceDetectionException.noFaceDetected();
    }

    if (faces.length > 1) {
      throw FaceDetectionException.multipleFaceDetected();
    }
  }
}
