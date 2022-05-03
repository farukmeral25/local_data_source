import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_key_with_value_param.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';

class SaveDataFromKeyUsecase implements Usecase<void, LocalKeyWithValueParam> {
  final ILocalRepository localRepository;

  SaveDataFromKeyUsecase({required this.localRepository});

  @override
  Future<Either<Failure, void>> call(LocalKeyWithValueParam params) {
    return localRepository.saveDataFromKey(params);
  }
}
