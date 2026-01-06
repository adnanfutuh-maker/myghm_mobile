import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/register_result_model.dart';
import '../../../../../core/exceptions/app_exception.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;

  const factory RegisterState.success(RegisterResultModel result) = _Success;

  const factory RegisterState.failure(AppException failure) = _Failure;
}
