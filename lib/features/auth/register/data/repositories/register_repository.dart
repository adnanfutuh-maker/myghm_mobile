import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:myghm_mobile/features/auth/register/data/datasources/register_datasource.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../models/register_data_model.dart';
import '../models/register_result_model.dart';

abstract class RegisterRepository {
  Future<Either<AppException, RegisterResultModel>> getRegister(
    RegisterDataModel data,
  );
}

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource datasource;

  RegisterRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppException, RegisterResultModel>> getRegister(
    RegisterDataModel data,
  ) async {
    try {
      final result = await datasource.getRegister(data);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
