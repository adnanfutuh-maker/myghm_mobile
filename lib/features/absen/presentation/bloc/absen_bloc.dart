import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:myghm_mobile/features/absen/domain/usecases/validate_face_usecase.dart';

import '../../domain/usecases/pick_absen_image_usecase.dart';
import 'absen_event.dart';
import 'absen_state.dart';

@injectable
class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  final PickAbsenImageUsecase pickImageUsecase;
  final ValidateFaceUsecase validateFaceUsecase;

  AbsenBloc(this.pickImageUsecase, this.validateFaceUsecase)
    : super(const AbsenState.initial()) {
    on<AbsenEvent>((event, emit) async {
      await event.when(pickFromCamera: () => _onPickFromCamera(emit));
    });
  }

  Future<void> _onPickFromCamera(Emitter<AbsenState> emit) async {
    emit(const AbsenState.loading());

    try {
      final image = await pickImageUsecase.fromCamera();

      if (image == null) {
        emit(const AbsenState.initial());
        return;
      }

      await validateFaceUsecase(image);

      emit(AbsenState.success(image));
    } catch (e) {
      emit(
        const AbsenState.error(
          'Foto tidak valid, pastikan hanya 1 wajah terlihat jelas',
        ),
      );
    }
  }
}
