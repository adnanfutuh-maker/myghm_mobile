import 'package:injectable/injectable.dart';
import 'package:myghm_mobile/features/auth/register/data/models/register_data_model.dart';
import 'package:myghm_mobile/features/auth/register/data/models/register_result_model.dart';
import '../../../../../core/env/env.dart';
import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/services/http/http_client_service.dart';

abstract class RegisterDatasource {
  Future<RegisterResultModel> getRegister(RegisterDataModel data);
}

@LazySingleton(as: RegisterDatasource)
class RegisterDatasourceImpl implements RegisterDatasource {
  final HttpClientService httpClientService;

  RegisterDatasourceImpl({@Named('base') required this.httpClientService});

  @override
  Future<RegisterResultModel> getRegister(RegisterDataModel data) async {
    try {
      final response = await httpClientService.post(
        path: '${Env.baseEndpoint}register-device/',
        data: data.toJson(),
      );
      return RegisterResultModel.fromJson(response.data);
    } on InternetConnectionException catch (e) {
      throw InternetConnectionException(code: e.code, message: e.message);
    } catch (e) {
      throw ServerException(error: e, message: e.toString());
    }
  }
}
