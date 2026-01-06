import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:myghm_mobile/features/auth/register/data/models/register_data_model.dart';
import 'package:myghm_mobile/features/auth/register/data/repositories/register_repository.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../data/models/register_result_model.dart';

@lazySingleton
class RegisterUsecase {
  final RegisterRepository repository;
  RegisterUsecase({required this.repository});
  Future<Either<AppException, RegisterResultModel>> call(
    RegisterDataModel data,
  ) async {
    return await repository.getRegister(data);
  }
}
