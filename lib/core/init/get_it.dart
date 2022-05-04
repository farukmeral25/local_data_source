import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:local_data_source/core/utils/local_data_source/data/repository/local_repository.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/get_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/remove_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/save_data_from_key.dart';
import 'package:local_data_source/feature/credential/data/repository/credential_repository.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';
import 'package:local_data_source/feature/credential/domain/usecases/cache_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/get_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/remove_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // final sharedPref = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton<SharedPreferences>(() => sharedPref);

  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<ILocalRepository>(
      () => LocalRepository(secureStorage: getIt()));

  getIt.registerLazySingleton(
      () => GetDataFromKeyUsecase(localRepository: getIt()));
  getIt.registerLazySingleton(
      () => SaveDataFromKeyUsecase(localRepository: getIt()));
  getIt.registerLazySingleton(
      () => RemoveDataFromKeyUsecase(localRepository: getIt()));

  getIt.registerLazySingleton<ICredentialRepository>(
    () => CredentialRepository(
      getDataFromKeyUsecase: getIt(),
      saveDataFromKeyUsecase: getIt(),
      removeDataFromKeyUsecase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
      () => GetUserInfoUsecase(credentialRepository: getIt()));
  getIt.registerLazySingleton(
      () => CacheUserInfoUsecase(credentialRepository: getIt()));
  getIt.registerLazySingleton(
      () => RemoveUserInfoUsecase(credentialRepository: getIt()));

  getIt.registerLazySingleton(
    () => CredentialProvider(
      getUserInfoUsecase: getIt(),
      cacheUserInfoUsecase: getIt(),
      removeUserInfoUsecase: getIt(),
    ),
  );
}
