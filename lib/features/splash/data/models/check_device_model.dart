import 'package:freezed_annotation/freezed_annotation.dart';
part 'check_device_model.freezed.dart';
part 'check_device_model.g.dart';

@freezed
abstract class CheckDeviceModel with _$CheckDeviceModel {
  const factory CheckDeviceModel({
    required String status,
    required String message,
    @JsonKey(name: "register_apps") String? registerApps,
    @JsonKey(name: "access_token") String? accessToken,
    @JsonKey(name: "token_type") String? tokenType,
    @JsonKey(name: "expires_in") int? expiresIn,
  }) = _CheckDeviceModel;

  factory CheckDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$CheckDeviceModelFromJson(json);
}
