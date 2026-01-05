import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FaceDetectionDevice)
class FaceDetectionDeviceImpl implements FaceDetectionDevice {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
      enableLandmarks: false,
      enableContours: false,
      enableClassification: false,
    ),
  );

  @override
  Future<List<Face>> detectFace(File image) async {
    final inputImage = InputImage.fromFile(image);
    final faces = await _faceDetector.processImage(inputImage);
    return faces;
  }
}

abstract class FaceDetectionDevice {
  Future<List<Face>> detectFace(File image);
}
