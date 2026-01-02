import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image_event.freezed.dart';

@freezed
class ProfileImageEvent with _$ProfileImageEvent {
  const factory ProfileImageEvent.pickFromCamera() = _PickFromCamera;
  const factory ProfileImageEvent.pickFromGallery() = _PickFromGallery;
  const factory ProfileImageEvent.loadSavedImage() = _LoadSavedImage;
  const factory ProfileImageEvent.deleteImage() = _DeleteImage;
}
