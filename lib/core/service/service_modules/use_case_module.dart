import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/get_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/remove_data_from_key.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/usecase/save_data_from_key.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/usecase/remote_get_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/cache_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/get_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/remove_user_info_usecase.dart';
import 'package:local_data_source/feature/home/domain/usecase/fetch_todo_usecase.dart';

Future<void> usecaseServices() async {
  getDataFromKeyUsecaseProvider =
      Provider.autoDispose((ref) => GetDataFromKeyUsecase(ref));
  saveDataFromKeyUsecaseProvider =
      Provider.autoDispose((ref) => SaveDataFromKeyUsecase(ref));
  removeDataFromKeyUsecaseProvider =
      Provider.autoDispose((ref) => RemoveDataFromKeyUsecase(ref));
  fetchTodoUsecaseProvider =
      Provider.autoDispose((ref) => FetchTodoUsecase(ref));
  remoteGetUsecaseProvider =
      Provider.autoDispose((ref) => RemoteGetUsecase(ref));
  getUserInfoUsecaseProvider =
      Provider.autoDispose((ref) => GetUserInfoUsecase(ref));
  cacheUserInfoUsecaseProvider =
      Provider.autoDispose((ref) => CacheUserInfoUsecase(ref));
  removeUserInfoUsecaseProvider =
      Provider.autoDispose((ref) => RemoveUserInfoUsecase(ref));
}

late final AutoDisposeProvider<GetDataFromKeyUsecase>
    getDataFromKeyUsecaseProvider;
late final AutoDisposeProvider<SaveDataFromKeyUsecase>
    saveDataFromKeyUsecaseProvider;
late final AutoDisposeProvider<RemoveDataFromKeyUsecase>
    removeDataFromKeyUsecaseProvider;
late final AutoDisposeProvider<RemoteGetUsecase> remoteGetUsecaseProvider;

late final AutoDisposeProvider<FetchTodoUsecase> fetchTodoUsecaseProvider;

late final AutoDisposeProvider<GetUserInfoUsecase> getUserInfoUsecaseProvider;
late final AutoDisposeProvider<CacheUserInfoUsecase>
    cacheUserInfoUsecaseProvider;
late final AutoDisposeProvider<RemoveUserInfoUsecase>
    removeUserInfoUsecaseProvider;
