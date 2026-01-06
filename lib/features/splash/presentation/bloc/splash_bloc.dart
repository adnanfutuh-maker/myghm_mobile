import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/services/geolocation/geolocation_service.dart';
import '../../../../core/services/storage/secure_storage.dart';
import '../../domain/usecases/check_app_version.dart';
import '../../domain/usecases/check_connection_server_usecase.dart';
import '../../domain/usecases/check_device_usecase.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GeolocationService geolocationService;
  final SecureStorageService secureStorage;

  final CheckConnectionServer checkConnectionServer;
  final CheckAppVersion checkAppVersion;
  final CheckDeviceUsecase checkDevice;

  SplashBloc(
    this.geolocationService,
    this.checkConnectionServer,
    this.checkAppVersion,
    this.checkDevice,
    this.secureStorage,
  ) : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const SplashState.loading());

          try {
            // 1. Cek lokasi
            await geolocationService.getCurrentPosition();

            // 2. Cek koneksi server
            final networkResult = await checkConnectionServer();
            final serverCheck = networkResult.fold((failure) {
              if (failure is InternetConnectionException) {
                emit(const SplashState.noInternet());
                return false;
              } else if (failure is ServerException) {
                emit(const SplashState.serverDown());
                return false;
              } else {
                emit(SplashState.failure(failure));
                return false;
              }
            }, (_) => true);
            if (!serverCheck) return;

            // 3. Cek versi aplikasi
            final versionResult = await checkAppVersion();
            bool versionOk = versionResult.fold((failure) {
              if (failure is InternetConnectionException) {
                emit(const SplashState.noInternet());
                return false;
              } else if (failure is ServerException) {
                emit(const SplashState.serverDown());
                return false;
              }
              emit(SplashState.failure(failure));
              return false;
            }, (_) => true);
            if (!versionOk) return;

            // 4. Cek device
            final deviceResult = await checkDevice();
            deviceResult.fold(
              (failure) {
                if (failure is InternetConnectionException) {
                  emit(const SplashState.noInternet());
                  return false;
                } else if (failure is ServerException) {
                  emit(const SplashState.serverDown());
                  return false;
                } else if (failure is DeviceNotRegistered) {
                  emit(const SplashState.deviceNotRegistered());
                  return false;
                }

                emit(SplashState.failure(failure));
              },
              (device) {
                final token = device.accessToken;

                if (device.registerApps == null) {
                  emit(const SplashState.deviceNotRegistered());
                  return;
                }
                if (device.message.toLowerCase() == "Device Tidak Ditemukan") {
                  emit(const SplashState.deviceNotRegistered());
                } else if ((device.expiresIn ?? 0) <= 0) {
                  secureStorage.delete('access_token');
                  emit(const SplashState.deviceTokenExpired());
                } else {
                  if (token != null) {
                    secureStorage.write('access_token', token);
                  }

                  emit(const SplashState.deviceValid());
                }
              },
            );
          } on LocationPermissionException {
            emit(const SplashState.locationPermissionDenied());
          } on AppException catch (e) {
            emit(SplashState.failure(e));
          } catch (_) {
            emit(const SplashState.failure(DefaultAppException()));
          }
        },
      );
    });
  }
}
