import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:injectable/injectable.dart';

import '../../exceptions/app_exception.dart';

@LazySingleton(as: FaceDetectionDevice)
class FaceDetectionDeviceImpl implements FaceDetectionDevice {
  late final FaceDetector _faceDetector;

  FaceDetectionDeviceImpl() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        enableLandmarks: false,
        enableContours: false,
        enableClassification: false,
      ),
    );
  }

  @override
  Future<List<Face>> detectFace(File image) async {
    if (image.path.isEmpty) {
      throw FaceDetectionException.emptyPath();
    }

    final exists = await image.exists();
    if (!exists) {
      throw FaceDetectionException.fileNotFound();
    }

    try {
      final inputImage = InputImage.fromFile(image);
      final faces = await _faceDetector.processImage(inputImage);
      return faces;
    } catch (_) {
      throw FaceDetectionException.processFailed();
    }
  }

  Future<void> dispose() async {
    await _faceDetector.close();
  }
}

abstract class FaceDetectionDevice {
  Future<List<Face>> detectFace(File image);
}
