import 'package:injectable/injectable.dart';

import '../../../../core/device/profile_image_storage_device.dart';

@lazySingleton
class DeleteProfileImageUsecase {
  final ProfileImageStorage storage;

  DeleteProfileImageUsecase(this.storage);

  Future<void> call() => storage.clear();
}
