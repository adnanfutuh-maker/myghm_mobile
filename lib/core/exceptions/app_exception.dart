import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String code;
  final String message;
  const AppException({required this.code, required this.message});
  @override
  List<Object?> get props => [code, message];
}

class DefaultAppException extends AppException {
  const DefaultAppException({
    super.code = '',
    super.message = 'DEFAULT_APP_EXCEPTION',
  });
}

class InternetConnectionException extends AppException {
  const InternetConnectionException({
    super.code = 'INTERNET_CONNECTION_ERROR',
    super.message = 'INTERNET_CONNECTION_EXCEPTION',
  });
}

class LocationPermissionException extends AppException {
  const LocationPermissionException(
    String s, {
    super.code = 'LOCATION_PERMISSION_DENIED',
    super.message = 'LOCATION_PERMISSION_DENIED',
  });
}

class ServerException extends AppException {
  final dynamic error;
  const ServerException({
    super.message = 'SERVER_ERROR',
    super.code = 'SERVER_EXCEPTION',
    this.error,
  });
}

class DeviceNotRegistered extends AppException {
  const DeviceNotRegistered({
    super.message = 'Device Tidak Ditemukan',
    super.code = 'Device Tidak Ditemukan',
  });
}

class LocalStorageException extends AppException {
  const LocalStorageException({
    super.message = 'LOCAL_STORAGE_ERROR',
    super.code = 'LOCAL_STORAGE_EXCEPTION',
  });
}

class FiscalException extends AppException {
  const FiscalException({
    super.message = 'FISCAL_ERROR',
    super.code = 'FISCALIZATION_EXCEPTION',
  });
}

class FaceDetectionException extends AppException {
  const FaceDetectionException({required super.code, required super.message});

  /// Path gambar kosong
  factory FaceDetectionException.emptyPath() {
    return const FaceDetectionException(
      code: 'FACE_IMAGE_PATH_EMPTY',
      message: 'Path gambar kosong',
    );
  }

  /// File gambar tidak ditemukan
  factory FaceDetectionException.fileNotFound() {
    return const FaceDetectionException(
      code: 'FACE_IMAGE_NOT_FOUND',
      message: 'File gambar tidak ditemukan',
    );
  }

  /// Tidak ada wajah terdeteksi
  factory FaceDetectionException.noFaceDetected() {
    return const FaceDetectionException(
      code: 'FACE_NOT_DETECTED',
      message: 'Wajah tidak terdeteksi, pastikan wajah terlihat jelas',
    );
  }

  /// Lebih dari satu wajah
  factory FaceDetectionException.multipleFaceDetected() {
    return const FaceDetectionException(
      code: 'MULTIPLE_FACE_DETECTED',
      message: 'Terdeteksi lebih dari satu wajah',
    );
  }

  /// Error ML Kit / proses gagal
  factory FaceDetectionException.processFailed() {
    return const FaceDetectionException(
      code: 'FACE_PROCESS_FAILED',
      message: 'Gagal memproses deteksi wajah',
    );
  }
}
