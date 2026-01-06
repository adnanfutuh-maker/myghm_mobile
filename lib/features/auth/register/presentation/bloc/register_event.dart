import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/register_data_model.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;

  const factory RegisterEvent.submit({required RegisterDataModel data}) =
      _Submit;
}
