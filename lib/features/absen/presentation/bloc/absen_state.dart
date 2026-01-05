import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absen_state.freezed.dart';

@freezed
class AbsenState with _$AbsenState {
  const factory AbsenState.initial() = _Initial;
  const factory AbsenState.loading() = _Loading;
  const factory AbsenState.success(File image) = _Success;
  const factory AbsenState.error(String message) = _Error;
}
