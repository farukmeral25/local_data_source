import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/constants/theme/app_colors.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/service/service_modules/util_module.dart';
import 'package:local_data_source/core/shared/snackbar_widget.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/route_manager/data/repository/route_manager.dart';
import 'package:local_data_source/core/utils/route_manager/domain/entity/route.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/feature/credential/domain/usecases/cache_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/remove_user_info_usecase.dart';

class CredentialViewModel {
  late final CacheUserInfoUsecase _cacheUserInfoUsecase;
  late final RemoveUserInfoUsecase _removeUserInfoUsecase;
  final Ref ref;

  CredentialViewModel(this.ref)
      : _cacheUserInfoUsecase = ref.read(cacheUserInfoUsecaseProvider),
        _removeUserInfoUsecase = ref.read(removeUserInfoUsecaseProvider);

  TextEditingController textEditingControllerUserName =
      TextEditingController(text: "username");
  TextEditingController textEditingControllerMail =
      TextEditingController(text: "mail@gmail.com");
  TextEditingController textEditingControllerPassword =
      TextEditingController(text: "password");

  final _userName = "username";
  final _mail = "mail@gmail.com";
  final _password = "password";

  void logIn() async {
    if (condition) {
      ref.read(appUserProvider).userInfo = UserInfoModel(
        userName: textEditingControllerUserName.text,
        mail: textEditingControllerMail.text,
        password: textEditingControllerPassword.text,
      );
      final cacheUserInfoEither = await _cacheUserInfoUsecase(
        UserInfoModel(
          userName: textEditingControllerUserName.text,
          mail: textEditingControllerMail.text,
          password: textEditingControllerPassword.text,
        ),
      );
      cacheUserInfoEither.fold((failure) {
        showSnackBar(
          title: "Error: $failure",
        );
        return Left(failure);
      }, (data) {
        showSnackBar(
          title: "Login successful",
          color: AppColor.green,
        );
        RouteManager.routeManager.pageAndRemoveUntil(homePageRoute);
        return const Right(null);
      });
    } else {
      showSnackBar(
        title: "Error: ${UserNotFoundFailure().errorMessage()}",
      );
    }
  }

  void logOut() async {
    final removeUserInfoEither =
        await _removeUserInfoUsecase(LocalKeys.cacheuserinfo);
    removeUserInfoEither.fold((failure) {
      showSnackBar(
        title: "Error: $failure",
      );
      return Left(failure);
    }, (data) {
      RouteManager.routeManager.pageAndRemoveUntil(loginPageRoute);
      showSnackBar(
        title: "Logout successful",
        color: AppColor.orange,
      );
      return const Right(null);
    });
  }

  bool get condition =>
      textEditingControllerUserName.text == _userName &&
      textEditingControllerMail.text == _mail &&
      textEditingControllerPassword.text == _password;
}
