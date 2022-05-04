import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/utils/app_user.dart';

Future<void> utilService() async {
  appUserProvider = Provider((ref) => AppUser());
}

late final Provider<AppUser> appUserProvider;
