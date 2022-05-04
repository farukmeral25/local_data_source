import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_data_source/core/service/service_module.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_with_value_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_param.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';

class LocalRepository implements ILocalRepository {
  final FlutterSecureStorage secureStorage;

  LocalRepository(Ref _ref) : secureStorage = _ref.read(secureStorageProvider);

  @override
  Future<Either<Failure, String>> getDataFromKey(LocalKeyParam param) async {
    String? value = await secureStorage.read(key: param.localKey.getLocalKey());
    if (value != null) {
      return Right(value);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(LocalKeyParam param) async {
    try {
      await secureStorage.delete(key: param.localKey.getLocalKey());
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(
      LocalKeyWithValueParam param) async {
    try {
      await secureStorage.write(
          key: param.localKey.getLocalKey(), value: param.value);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
