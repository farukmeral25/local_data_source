import 'package:local_data_source/core/service/repository_module.dart';
import 'package:local_data_source/core/service/service_module.dart';
import 'package:local_data_source/core/service/use_case_module.dart';
import 'package:local_data_source/core/service/util_module.dart';
import 'package:local_data_source/core/service/view_model_module.dart';

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
