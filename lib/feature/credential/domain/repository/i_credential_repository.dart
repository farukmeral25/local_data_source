import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';

abstract class ICredentialRepository {
  Future<Either<Failure, UserInfo>> getUserInfo(LocalKeys key);
  Future<Either<Failure, void>> cacheUserInfo(UserInfoModel userInfoModel);
  Future<Either<Failure, void>> removeUserInfo(LocalKeys key);
}
