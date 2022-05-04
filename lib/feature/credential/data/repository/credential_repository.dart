import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_with_value_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/get_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/remove_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/save_data_from_key.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

class CredentialRepository implements ICredentialRepository {
  late final GetDataFromKeyUsecase _getDataFromKeyUsecase;
  late final SaveDataFromKeyUsecase _saveDataFromKeyUsecase;
  late final RemoveDataFromKeyUsecase _removeDataFromKeyUsecase;

  CredentialRepository(Ref _ref)
      : _getDataFromKeyUsecase = _ref.read(getDataFromKeyUsecaseProvider),
        _saveDataFromKeyUsecase = _ref.read(saveDataFromKeyUsecaseProvider),
        _removeDataFromKeyUsecase = _ref.read(removeDataFromKeyUsecaseProvider);

  @override
  Future<Either<Failure, UserInfo>> getUserInfo(LocalKeys key) async {
    try {
      final getUserInfoEither =
          await _getDataFromKeyUsecase(LocalKeyParam(localKey: key));
      return getUserInfoEither.fold(
        (failure) => Left(failure),
        (data) {
          UserInfo userInfo = UserInfoModel.fromJson(data);
          return Right(userInfo);
        },
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> cacheUserInfo(
      UserInfoModel userInfoModel) async {
    try {
      final cacheUserInfoEither = await _saveDataFromKeyUsecase(
        LocalKeyWithValueParam(
          localKey: LocalKeys.cacheuserinfo,
          value: userInfoModel.toJson(),
        ),
      );
      return cacheUserInfoEither.fold(
        (failure) => Left(failure),
        (data) => const Right(null),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeUserInfo(LocalKeys key) async {
    try {
      final removeUserInfoEither =
          await _removeDataFromKeyUsecase(LocalKeyParam(localKey: key));
      return removeUserInfoEither.fold(
        (failure) => Left(failure),
        (data) {
          return const Right(null);
        },
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
