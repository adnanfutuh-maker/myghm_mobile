import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
