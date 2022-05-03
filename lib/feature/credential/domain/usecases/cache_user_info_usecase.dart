import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class CacheUserInfoUsecase implements Usecase<void, UserInfoModel> {
  final ICredentialRepository credentialRepository;

  CacheUserInfoUsecase({required this.credentialRepository});
  @override
  Future<Either<Failure, void>> call(UserInfoModel params) async {
    return await credentialRepository.cacheUserInfo(params);
  }
}
