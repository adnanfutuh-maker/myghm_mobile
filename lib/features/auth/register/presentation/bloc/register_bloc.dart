import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../data/models/register_data_model.dart';

import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterBloc(this.registerUsecase) : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const RegisterState.initial());
        },
        submit: (RegisterDataModel data) async {
          emit(const RegisterState.loading());

          final result = await registerUsecase(data);

          result.fold(
            (failure) {
              if (failure is InternetConnectionException) {
                emit(const RegisterState.noInternet());
                return false;
              } else if (failure is ServerException) {
                emit(const RegisterState.serverDown());
                return false;
              }
              if (failure is DataNotFoundException) {
                emit(const RegisterState.dataNotFound());
                return false;
              }

              emit(RegisterState.failure(failure));
            },
            (success) {
              emit(RegisterState.success(success));
            },
          );
        },
      );
    });
  }
}
