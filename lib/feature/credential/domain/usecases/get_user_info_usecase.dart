import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class GetUserInfoUsecase implements Usecase<UserInfo, LocalKeys> {
  final ICredentialRepository credentialRepository;

  GetUserInfoUsecase({required this.credentialRepository});
  @override
  Future<Either<Failure, UserInfo>> call(params) async {
    return await credentialRepository.getUserInfo(params);
  }
}
