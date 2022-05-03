import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class RemoveUserInfoUsecase implements Usecase<void, LocalKeys> {
  final ICredentialRepository credentialRepository;

  RemoveUserInfoUsecase({required this.credentialRepository});
  @override
  Future<Either<Failure, void>> call(LocalKeys params) async {
    return await credentialRepository.removeUserInfo(params);
  }
}
