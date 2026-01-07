import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:myghm_mobile/features/splash/data/models/check_app_version_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/env/env.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/services/http/http_client_service.dart';

abstract class CheckAppVersionDatasource {
  Future<CheckAppVersionModel> getAppVersion();
}

@LazySingleton(as: CheckAppVersionDatasource)
class CheckAppVersionDatasourceImpl implements CheckAppVersionDatasource {
  final HttpClientService httpClientService;

  CheckAppVersionDatasourceImpl({
    @Named('base') required this.httpClientService,
  });

  @override
  Future<CheckAppVersionModel> getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = int.parse(packageInfo.version.split('.').last);
      final response = await httpClientService.post(
        path: '${Env.baseEndpoint}check-version/',
        data: {'version_id': currentVersion},
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      return CheckAppVersionModel.fromJson(response.data);
    } on InternetConnectionException catch (e) {
      throw InternetConnectionException(code: e.code, message: e.message);
    } catch (e) {
      throw ServerException(error: e, message: e.toString());
    }
  }
}
