import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:myghm_mobile/features/splash/data/models/check_device_model.dart';
import '../../../../core/device/device_id/device_id.dart';
import '../../../../core/env/env.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/services/http/http_client_service.dart';

abstract class CheckDeviceDatasource {
  Future<CheckDeviceModel> getDevice();
}

@LazySingleton(as: CheckDeviceDatasource)
class CheckDeviceDatasourceImpl implements CheckDeviceDatasource {
  final HttpClientService httpClientService;
  final DeviceId deviceIdService;

  CheckDeviceDatasourceImpl({
    @Named('base') required this.httpClientService,
    required this.deviceIdService,
  });

  @override
  Future<CheckDeviceModel> getDevice() async {
    try {
      final deviceId = await deviceIdService.getDeviceId();

      final response = await httpClientService.post(
        path: '${Env.baseEndpoint}check-device/',
        data: {'device_id': deviceId},
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      if (response.statusCode == 422) {
        throw DeviceNotRegistered();
      }

      return CheckDeviceModel.fromJson(response.data);
    } on InternetConnectionException catch (e) {
      throw InternetConnectionException(code: e.code, message: e.message);
    } on DeviceNotRegistered catch (e) {
      throw DeviceNotRegistered(code: e.code, message: e.message);
    } catch (e) {
      throw ServerException(error: e, message: e.toString());
    }
  }
}
