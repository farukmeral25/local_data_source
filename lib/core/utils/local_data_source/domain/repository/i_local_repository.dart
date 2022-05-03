import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_with_value_param.dart';

abstract class ILocalRepository {
  Future<Either<Failure, String>> getDataFromKey(LocalKeyParam param);
  Future<Either<Failure, void>> removeDataFromKey(LocalKeyParam param);
  Future<Either<Failure, void>> saveDataFromKey(LocalKeyWithValueParam param);
}
