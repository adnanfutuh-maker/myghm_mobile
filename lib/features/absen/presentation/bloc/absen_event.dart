import 'package:freezed_annotation/freezed_annotation.dart';

part 'absen_event.freezed.dart';

@freezed
class AbsenEvent with _$AbsenEvent {
  const factory AbsenEvent.pickFromCamera() = _PickFromCamera;
}
