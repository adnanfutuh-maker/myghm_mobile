// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterDataModel _$RegisterDataModelFromJson(Map<String, dynamic> json) =>
    _RegisterDataModel(
      deviceId: json['device_id'] as String,
      nip: json['nip'] as String,
      email: json['email'] as String,
      phone: json['hp'] as String,
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$RegisterDataModelToJson(_RegisterDataModel instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'nip': instance.nip,
      'email': instance.email,
      'hp': instance.phone,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'timezone': instance.timezone,
    };
