import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/service/service_modules/repository_module.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class CacheUserInfoUsecase implements Usecase<void, UserInfoModel> {
  final ICredentialRepository _credentialRepository;

  CacheUserInfoUsecase(Ref _ref)
      : _credentialRepository = _ref.read(credentialRepositoryProvider);
  @override
  Future<Either<Failure, void>> call(UserInfoModel params) async {
    return await _credentialRepository.cacheUserInfo(params);
  }
}
