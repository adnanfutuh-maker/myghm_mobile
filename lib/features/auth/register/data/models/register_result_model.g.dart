// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResultModel _$RegisterResultModelFromJson(Map<String, dynamic> json) =>
    _RegisterResultModel(
      status: json['status'] as String,
      message: json['message'] as String,
      token: json['token'] as String,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegisterResultModelToJson(
  _RegisterResultModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'token': instance.token,
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
};
