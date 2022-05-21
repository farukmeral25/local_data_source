import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/service_module.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/entity/main_endpoints.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/entity/status_codes.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/repository/i_remote_repository.dart';

class RemoteRepository implements IRemoteRepository {
  final Dio dioManager;
  RemoteRepository(Ref _ref) : dioManager = _ref.read(dioProvider);

  @override
  Future<Either<Failure, String>> remoteGet(
      {required MainEndpoint mainEndpoint}) async {
    try {
      final response = await dioManager.get(mainEndpoint.endpointName);
      if (response.statusCode == StatusCodes.statusCode200.getStatusCode) {
        return Right(json.encode(response.data));
      } else {
        return Left(
            StatusCodes.statusCode200.getFailure(response.statusCode ?? 404));
      }
    } on Failure catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Failure, String>> remotePost(
      {required Map<String, dynamic> requestBody,
      required MainEndpoint mainEndpoint}) {
    // TODO: implement remotePost
    throw UnimplementedError();
  }
}
