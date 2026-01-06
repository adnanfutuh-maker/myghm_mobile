// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResultModel {

 String get status; String get message; String get token;@JsonKey(name: "token_type") String? get tokenType;@JsonKey(name: "expires_in") int? get expiresIn;
/// Create a copy of RegisterResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResultModelCopyWith<RegisterResultModel> get copyWith => _$RegisterResultModelCopyWithImpl<RegisterResultModel>(this as RegisterResultModel, _$identity);

  /// Serializes this RegisterResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,token,tokenType,expiresIn);

@override
String toString() {
  return 'RegisterResultModel(status: $status, message: $message, token: $token, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $RegisterResultModelCopyWith<$Res>  {
  factory $RegisterResultModelCopyWith(RegisterResultModel value, $Res Function(RegisterResultModel) _then) = _$RegisterResultModelCopyWithImpl;
@useResult
$Res call({
 String status, String message, String token,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "expires_in") int? expiresIn
});




}
/// @nodoc
class _$RegisterResultModelCopyWithImpl<$Res>
    implements $RegisterResultModelCopyWith<$Res> {
  _$RegisterResultModelCopyWithImpl(this._self, this._then);

  final RegisterResultModel _self;
  final $Res Function(RegisterResultModel) _then;

/// Create a copy of RegisterResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? token = null,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterResultModel].
extension RegisterResultModelPatterns on RegisterResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResultModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResultModel() when $default != null:
return $default(_that.status,_that.message,_that.token,_that.tokenType,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)  $default,) {final _that = this;
switch (_that) {
case _RegisterResultModel():
return $default(_that.status,_that.message,_that.token,_that.tokenType,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "expires_in")  int? expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResultModel() when $default != null:
return $default(_that.status,_that.message,_that.token,_that.tokenType,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResultModel implements RegisterResultModel {
  const _RegisterResultModel({required this.status, required this.message, required this.token, @JsonKey(name: "token_type") this.tokenType, @JsonKey(name: "expires_in") this.expiresIn});
  factory _RegisterResultModel.fromJson(Map<String, dynamic> json) => _$RegisterResultModelFromJson(json);

@override final  String status;
@override final  String message;
@override final  String token;
@override@JsonKey(name: "token_type") final  String? tokenType;
@override@JsonKey(name: "expires_in") final  int? expiresIn;

/// Create a copy of RegisterResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResultModelCopyWith<_RegisterResultModel> get copyWith => __$RegisterResultModelCopyWithImpl<_RegisterResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResultModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,token,tokenType,expiresIn);

@override
String toString() {
  return 'RegisterResultModel(status: $status, message: $message, token: $token, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$RegisterResultModelCopyWith<$Res> implements $RegisterResultModelCopyWith<$Res> {
  factory _$RegisterResultModelCopyWith(_RegisterResultModel value, $Res Function(_RegisterResultModel) _then) = __$RegisterResultModelCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, String token,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "expires_in") int? expiresIn
});




}
/// @nodoc
class __$RegisterResultModelCopyWithImpl<$Res>
    implements _$RegisterResultModelCopyWith<$Res> {
  __$RegisterResultModelCopyWithImpl(this._self, this._then);

  final _RegisterResultModel _self;
  final $Res Function(_RegisterResultModel) _then;

/// Create a copy of RegisterResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? token = null,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_RegisterResultModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
