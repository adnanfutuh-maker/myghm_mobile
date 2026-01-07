import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DeviceId)
class DeviceIdImpl implements DeviceId {
  @override
  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? 'unknown-ios-device';
    } else {
      return 'unknown-device';
    }
  }
}

abstract class DeviceId {
  Future<String> getDeviceId();
}
