import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/entity/main_endpoints.dart';

abstract class IRemoteRepository {
  Future<Either<Failure, String>> remoteGet({
    required MainEndpoint mainEndpoint,
  });

  Future<Either<Failure, String>> remotePost({
    required Map<String, dynamic> requestBody,
    required MainEndpoint mainEndpoint,
  });
}
