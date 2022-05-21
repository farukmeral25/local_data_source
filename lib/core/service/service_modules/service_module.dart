import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/http_manager/dio_manager.dart';

Future<void> services() async {
  secureStorageProvider = Provider((ref) => const FlutterSecureStorage());
  connectivityProvider = Provider((ref) => Connectivity());
  dioProvider = Provider.autoDispose(((ref) => DioManager(ref).getDio()));
}

late final Provider<FlutterSecureStorage> secureStorageProvider;
late final Provider<Connectivity> connectivityProvider;
late final AutoDisposeProvider<Dio> dioProvider;
