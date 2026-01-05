import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ImagePickerDevice)
class ImagePickerDeviceImpl implements ImagePickerDevice {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickFromCamera() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 80,
    );

    return image != null ? File(image.path) : null;
  }

  @override
  Future<File?> pickFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    return image != null ? File(image.path) : null;
  }
}

abstract class ImagePickerDevice {
  Future<File?> pickFromCamera();
  Future<File?> pickFromGallery();
}
