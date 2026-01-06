import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_data_model.freezed.dart';
part 'register_data_model.g.dart';

@freezed
abstract class RegisterDataModel with _$RegisterDataModel {
  const factory RegisterDataModel({
    @JsonKey(name: 'device_id') required String deviceId,
    required String nip,
    required String email,
    @JsonKey(name: 'hp') required String phone,
    required String password,
    required String rePassword,
    required String timezone,
  }) = _RegisterDataModel;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);
}
