import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_result_model.freezed.dart';
part 'register_result_model.g.dart';

@freezed
abstract class RegisterResultModel with _$RegisterResultModel {
  const factory RegisterResultModel({
    required String status,
    required String message,
    required String token,
    @JsonKey(name: "token_type") String? tokenType,
    @JsonKey(name: "expires_in") int? expiresIn,
  }) = _RegisterResultModel;

  factory RegisterResultModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultModelFromJson(json);
}
