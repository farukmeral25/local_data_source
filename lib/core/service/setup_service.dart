import 'package:local_data_source/core/service/service_modules/repository_module.dart';
import 'package:local_data_source/core/service/service_modules/service_module.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/service/service_modules/util_module.dart';
import 'package:local_data_source/core/service/service_modules/view_model_module.dart';

Future<void> setupServices() async {
  await Future.wait(
    [
      services(),
      utilService(),
      repositoryServices(),
      usecaseServices(),
      viewModelServices(),
    ],
    eagerError: true,
  );
}
