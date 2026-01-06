// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckDeviceModel _$CheckDeviceModelFromJson(Map<String, dynamic> json) =>
    _CheckDeviceModel(
      status: json['status'] as String,
      message: json['message'] as String,
      registerApps: json['register_apps'] as String?,
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckDeviceModelToJson(_CheckDeviceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'register_apps': instance.registerApps,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
