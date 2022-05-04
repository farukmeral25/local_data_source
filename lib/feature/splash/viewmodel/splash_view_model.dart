import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/constants/theme/app_colors.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/service/service_modules/util_module.dart';
import 'package:local_data_source/core/shared/snackbar_widget.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/route_manager/data/repository/route_manager.dart';
import 'package:local_data_source/core/utils/route_manager/domain/entity/route.dart';
import 'package:local_data_source/feature/credential/domain/usecases/get_user_info_usecase.dart';

class SplashViewModel {
  late final GetUserInfoUsecase _getUserInfoUsecase;
  final Ref ref;

  SplashViewModel(this.ref)
      : _getUserInfoUsecase = ref.read(getUserInfoUsecaseProvider) {
    userIsLoginned();
  }

  void userIsLoginned() async {
    final getUserInfoEither =
        await _getUserInfoUsecase(LocalKeys.cacheuserinfo);
    getUserInfoEither.fold((failure) async {
      RouteManager.routeManager.pageAndRemoveUntil(loginPageRoute);
      return Left(failure);
    }, (data) {
      ref.read(appUserProvider).userInfo = data;
      RouteManager.routeManager.pageAndRemoveUntil(homePageRoute);
      showSnackBar(
          title: "Welcome back", color: AppColor.amber, duration: 1000);
      return Right(data);
    });
  }
}
