import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> services() async {
  secureStorageProvider = Provider(
    (ref) => const FlutterSecureStorage(),
  );
}

late final Provider<FlutterSecureStorage> secureStorageProvider;
