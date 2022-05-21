import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/service/service_modules/repository_module.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/entity/main_endpoints.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/repository/i_remote_repository.dart';

class RemoteGetUsecase implements Usecase<String, MainEndpoint> {
  final IRemoteRepository _remoteRepository;

  RemoteGetUsecase(Ref _ref)
      : _remoteRepository = _ref.read(remoteRepositoryProvider);

  @override
  Future<Either<Failure, String>> call(MainEndpoint mainEndpoint) async {
    return await _remoteRepository.remoteGet(mainEndpoint: mainEndpoint);
  }
}
