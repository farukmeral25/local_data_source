import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';

class RemoveDataFromKeyUsecase implements Usecase<void, LocalKeyParam> {
  final ILocalRepository localRepository;

  RemoveDataFromKeyUsecase({required this.localRepository});

  @override
  Future<Either<Failure, void>> call(LocalKeyParam params) {
    return localRepository.removeDataFromKey(params);
  }
}
