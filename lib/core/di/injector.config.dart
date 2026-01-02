// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/profile/domain/usecases/delete_profile_image_usecase.dart'
    as _i90;
import '../../features/profile/domain/usecases/load_profile_image_usecase.dart'
    as _i919;
import '../../features/profile/domain/usecases/pick_profile_image_usecase.dart'
    as _i469;
import '../../features/profile/domain/usecases/save_profile_image_usecase.dart'
    as _i93;
import '../../features/profile/presentation/bloc/profile_image_bloc.dart'
    as _i171;
import '../../features/splash/data/datasources/check_app_version_datasource.dart'
    as _i241;
import '../../features/splash/data/datasources/check_connection_server_datasource.dart'
    as _i24;
import '../../features/splash/data/datasources/check_device_datasource.dart'
    as _i77;
import '../../features/splash/data/repositories/check_app_version_repository.dart'
    as _i589;
import '../../features/splash/data/repositories/check_connection_server_repository.dart'
    as _i492;
import '../../features/splash/data/repositories/check_device_repository.dart'
    as _i542;
import '../../features/splash/domain/usecases/check_app_version.dart' as _i470;
import '../../features/splash/domain/usecases/check_connection_server_usecase.dart'
    as _i282;
import '../../features/splash/domain/usecases/check_device_usecase.dart'
    as _i565;
import '../../features/splash/domain/usecases/check_internet_usecase.dart'
    as _i860;
import '../../features/splash/domain/usecases/check_location_permission_usecase.dart'
    as _i247;
import '../../features/splash/presentation/bloc/splash_bloc.dart' as _i442;
import '../device/image_picker_device.dart' as _i184;
import '../device/profile_image_storage_device.dart' as _i221;
import '../services/geolocation/geolocation_service.dart' as _i591;
import '../services/http/http_client_service.dart' as _i274;
import '../services/http/internet_connection_service.dart' as _i1024;
import '../services/logger/logger_service.dart' as _i327;
import '../services/storage/secure_storage.dart' as _i249;
import 'register_modul.dart' as _i1051;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i974.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i249.SecureStorageService>(
    () => _i249.SecureStorageService(),
  );
  gh.lazySingleton<_i247.CheckLocationPermissionUseCase>(
    () => _i247.CheckLocationPermissionUseCase(),
  );
  gh.factory<_i361.Dio>(() => registerModule.dio(), instanceName: 'base');
  gh.lazySingleton<_i184.ImagePickerDevice>(
    () => _i184.ImagePickerDeviceImpl(),
  );
  gh.lazySingleton<_i591.GeolocationService>(
    () => _i591.GeolocationServiceImpl(),
  );
  gh.factory<bool>(() => registerModule.showDebug, instanceName: 'show_debug');
  gh.lazySingleton<_i221.ProfileImageStorage>(
    () => _i221.ProfileImageStorageImpl(),
  );
  gh.lazySingleton<_i1024.InternetConnectionService>(
    () => _i1024.InternetConnectionServiceImpl(
      connectivity: gh<_i895.Connectivity>(),
    ),
  );
  gh.lazySingleton<_i469.PickProfileImageUsecase>(
    () => _i469.PickProfileImageUsecase(gh<_i184.ImagePickerDevice>()),
  );
  gh.lazySingleton<_i327.LoggerService>(
    () => _i327.LoggerServiceImpl(
      logger: gh<_i974.Logger>(),
      showDebug: gh<bool>(instanceName: 'show_debug'),
    ),
  );
  gh.lazySingleton<_i860.CheckInternetUseCase>(
    () => _i860.CheckInternetUseCase(gh<_i1024.InternetConnectionService>()),
  );
  gh.lazySingleton<_i90.DeleteProfileImageUsecase>(
    () => _i90.DeleteProfileImageUsecase(gh<_i221.ProfileImageStorage>()),
  );
  gh.lazySingleton<_i919.LoadProfileImageUsecase>(
    () => _i919.LoadProfileImageUsecase(gh<_i221.ProfileImageStorage>()),
  );
  gh.lazySingleton<_i93.SaveProfileImageUsecase>(
    () => _i93.SaveProfileImageUsecase(gh<_i221.ProfileImageStorage>()),
  );
  gh.lazySingleton<_i274.HttpClientService>(
    () => _i274.HttpClientServiceImpl(
      dio: gh<_i361.Dio>(instanceName: 'base'),
      internetConnectionService: gh<_i1024.InternetConnectionService>(),
      loggerService: gh<_i327.LoggerService>(),
    ),
    instanceName: 'base',
  );
  gh.lazySingleton<_i77.CheckDeviceDatasource>(
    () => _i77.CheckDeviceDatasourceImpl(
      httpClientService: gh<_i274.HttpClientService>(instanceName: 'base'),
    ),
  );
  gh.factory<_i171.ProfileImageBloc>(
    () => _i171.ProfileImageBloc(
      gh<_i919.LoadProfileImageUsecase>(),
      gh<_i469.PickProfileImageUsecase>(),
      gh<_i93.SaveProfileImageUsecase>(),
      gh<_i90.DeleteProfileImageUsecase>(),
    ),
  );
  gh.lazySingleton<_i24.CheckConnectionServerDatasource>(
    () => _i24.CheckConnectionServerDatasourceImpl(
      httpClientService: gh<_i274.HttpClientService>(instanceName: 'base'),
    ),
  );
  gh.lazySingleton<_i241.CheckAppVersionDatasource>(
    () => _i241.CheckAppVersionDatasourceImpl(
      httpClientService: gh<_i274.HttpClientService>(instanceName: 'base'),
    ),
  );
  gh.lazySingleton<_i542.CheckDeviceRepository>(
    () => _i542.CheckDeviceRepositoryImpl(
      datasource: gh<_i77.CheckDeviceDatasource>(),
    ),
  );
  gh.lazySingleton<_i492.CheckConnectionServerRepository>(
    () => _i492.CheckConnectionServerRepositoryImpl(
      checkconnectionserverdatasource:
          gh<_i24.CheckConnectionServerDatasource>(),
    ),
  );
  gh.lazySingleton<_i589.CheckAppVersionRepository>(
    () => _i589.CheckAppVersionRepositoryImpl(
      datasource: gh<_i241.CheckAppVersionDatasource>(),
    ),
  );
  gh.lazySingleton<_i565.CheckDeviceUsecase>(
    () =>
        _i565.CheckDeviceUsecase(repository: gh<_i542.CheckDeviceRepository>()),
  );
  gh.lazySingleton<_i470.CheckAppVersion>(
    () => _i470.CheckAppVersion(
      repository: gh<_i589.CheckAppVersionRepository>(),
    ),
  );
  gh.lazySingleton<_i282.CheckConnectionServer>(
    () => _i282.CheckConnectionServer(
      repository: gh<_i492.CheckConnectionServerRepository>(),
    ),
  );
  gh.factory<_i442.SplashBloc>(
    () => _i442.SplashBloc(
      gh<_i591.GeolocationService>(),
      gh<_i282.CheckConnectionServer>(),
      gh<_i470.CheckAppVersion>(),
      gh<_i565.CheckDeviceUsecase>(),
      gh<_i249.SecureStorageService>(),
    ),
  );
  return getIt;
}

class _$RegisterModule extends _i1051.RegisterModule {}
