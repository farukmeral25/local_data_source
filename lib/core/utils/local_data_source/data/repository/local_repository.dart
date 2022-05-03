import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_with_value_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_param.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements ILocalRepository {
  final SharedPreferences sharedPreferences;

  LocalRepository({required this.sharedPreferences});

  @override
  Future<Either<Failure, String>> getDataFromKey(LocalKeyParam param) async {
    String? value = sharedPreferences.getString(param.localKey.getLocalKey());
    if (value != null) {
      return Right(value);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(LocalKeyParam param) async {
    try {
      await sharedPreferences.remove(param.localKey.getLocalKey());
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(
      LocalKeyWithValueParam param) async {
    try {
      await sharedPreferences.setString(
          param.localKey.getLocalKey(), param.value);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
