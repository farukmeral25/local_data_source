import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/constants/app_constants.dart';
import 'package:local_data_source/core/service/service_modules/service_module.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/http_manager/dio_connectivity_request_retrier.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/http_manager/retry_interceptor.dart';

class DioManager {
  final Connectivity connectivity;
  DioManager(Ref _ref) : connectivity = _ref.read(connectivityProvider);

  Dio getDio() {
    Dio dio = Dio();
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: connectivity,
        ),
      ),
    );
    return dio;
  }
}
