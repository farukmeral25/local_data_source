import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/service/repository_module.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class GetUserInfoUsecase implements Usecase<UserInfo, LocalKeys> {
  late final ICredentialRepository _credentialRepository;

  GetUserInfoUsecase(Ref _ref)
      : _credentialRepository = _ref.read(credentialRepositoryProvider);

  @override
  Future<Either<Failure, UserInfo>> call(params) async {
    return await _credentialRepository.getUserInfo(params);
  }
}
