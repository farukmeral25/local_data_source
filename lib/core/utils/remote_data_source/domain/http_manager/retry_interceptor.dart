import 'dart:io';

import 'package:dio/dio.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/http_manager/dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({required this.requestRetrier});

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      if (_shouldRetry(err)) {
        return requestRetrier.scheduleRequestRetry(err.requestOptions);
      }
    } catch (exception) {
      return exception;
    }
    return err;
  }

  bool _shouldRetry(DioError err) =>
      err.type == DioErrorType.other &&
      err.error != null &&
      err.error == SocketException;
}
