// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckDeviceModel {

 String get status; String get message;@JsonKey(name: "register_apps") String? get registerApps;@JsonKey(name: "access_token") String? get accessToken;@JsonKey(name: "token_type") String? get tokenType;@JsonKey(name: "expires_in") int? get expiresIn;
/// Create a copy of CheckDeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckDeviceModelCopyWith<CheckDeviceModel> get copyWith => _$CheckDeviceModelCopyWithImpl<CheckDeviceModel>(this as CheckDeviceModel, _$identity);

  /// Serializes this CheckDeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckDeviceModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.registerApps, registerApps) || other.registerApps == registerApps)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,registerApps,accessToken,tokenType,expiresIn);

@override
String toString() {
  return 'CheckDeviceModel(status: $status, message: $message, registerApps: $registerApps, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $CheckDeviceModelCopyWith<$Res>  {
  factory $CheckDeviceModelCopyWith(CheckDeviceModel value, $Res Function(CheckDeviceModel) _then) = _$CheckDeviceModelCopyWithImpl;
@useResult
$Res call({
 String status, String message,@JsonKey(name: "register_apps") String? registerApps,@JsonKey(name: "access_token") String? accessToken,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "expires_in") int? expiresIn
});




}
/// @nodoc
class _$CheckDeviceModelCopyWithImpl<$Res>
    implements $CheckDeviceModelCopyWith<$Res> {
  _$CheckDeviceModelCopyWithImpl(this._self, this._then);

  final CheckDeviceModel _self;
  final $Res Function(CheckDeviceModel) _then;

/// Create a copy of CheckDeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? registerApps = freezed,Object? accessToken = freezed,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,registerApps: freezed == registerApps ? _self.registerApps : registerApps // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckDeviceModel].
extension CheckDeviceModelPatterns on CheckDeviceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckDeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckDeviceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckDeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckDeviceModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckDeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckDeviceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message, @JsonKey(name: "register_apps")  String? registerApps, @JsonKey(name: "access_token")  String? accessToken, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckDeviceModel() when $default != null:
return $default(_that.status,_that.message,_that.registerApps,_that.accessToken,_that.tokenType,_that.expiresIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message, @JsonKey(name: "register_apps")  String? registerApps, @JsonKey(name: "access_token")  String? accessToken, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)  $default,) {final _that = this;
switch (_that) {
case _CheckDeviceModel():
return $default(_that.status,_that.message,_that.registerApps,_that.accessToken,_that.tokenType,_that.expiresIn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message, @JsonKey(name: "register_apps")  String? registerApps, @JsonKey(name: "access_token")  String? accessToken, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _CheckDeviceModel() when $default != null:
return $default(_that.status,_that.message,_that.registerApps,_that.accessToken,_that.tokenType,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckDeviceModel implements CheckDeviceModel {
  const _CheckDeviceModel({required this.status, required this.message, @JsonKey(name: "register_apps") this.registerApps, @JsonKey(name: "access_token") this.accessToken, @JsonKey(name: "token_type") this.tokenType, @JsonKey(name: "expires_in") this.expiresIn});
  factory _CheckDeviceModel.fromJson(Map<String, dynamic> json) => _$CheckDeviceModelFromJson(json);

@override final  String status;
@override final  String message;
@override@JsonKey(name: "register_apps") final  String? registerApps;
@override@JsonKey(name: "access_token") final  String? accessToken;
@override@JsonKey(name: "token_type") final  String? tokenType;
@override@JsonKey(name: "expires_in") final  int? expiresIn;

/// Create a copy of CheckDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckDeviceModelCopyWith<_CheckDeviceModel> get copyWith => __$CheckDeviceModelCopyWithImpl<_CheckDeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckDeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckDeviceModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.registerApps, registerApps) || other.registerApps == registerApps)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,registerApps,accessToken,tokenType,expiresIn);

@override
String toString() {
  return 'CheckDeviceModel(status: $status, message: $message, registerApps: $registerApps, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$CheckDeviceModelCopyWith<$Res> implements $CheckDeviceModelCopyWith<$Res> {
  factory _$CheckDeviceModelCopyWith(_CheckDeviceModel value, $Res Function(_CheckDeviceModel) _then) = __$CheckDeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String status, String message,@JsonKey(name: "register_apps") String? registerApps,@JsonKey(name: "access_token") String? accessToken,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "expires_in") int? expiresIn
});




}
/// @nodoc
class __$CheckDeviceModelCopyWithImpl<$Res>
    implements _$CheckDeviceModelCopyWith<$Res> {
  __$CheckDeviceModelCopyWithImpl(this._self, this._then);

  final _CheckDeviceModel _self;
  final $Res Function(_CheckDeviceModel) _then;

/// Create a copy of CheckDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? registerApps = freezed,Object? accessToken = freezed,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_CheckDeviceModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,registerApps: freezed == registerApps ? _self.registerApps : registerApps // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
