import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/entity/local_keys.dart';
import 'package:local_data_source/core/utils/route_manager/data/repository/route_manager.dart';
import 'package:local_data_source/core/utils/route_manager/domain/entity/route.dart';
import 'package:local_data_source/feature/credential/data/model/user_info_model.dart';
import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';
import 'package:local_data_source/feature/credential/domain/usecases/cache_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/get_user_info_usecase.dart';
import 'package:local_data_source/feature/credential/domain/usecases/remove_user_info_usecase.dart';
import 'package:local_data_source/feature/home/view/page/home_page.dart';

class CredentialProvider with ChangeNotifier {
  final GetUserInfoUsecase getUserInfoUsecase;
  final CacheUserInfoUsecase cacheUserInfoUsecase;
  final RemoveUserInfoUsecase removeUserInfoUsecase;

  CredentialProvider(
      {required this.getUserInfoUsecase,
      required this.cacheUserInfoUsecase,
      required this.removeUserInfoUsecase});

  TextEditingController textEditingControllerUserName =
      TextEditingController(text: "username");
  TextEditingController textEditingControllerMail =
      TextEditingController(text: "mail@gmail.com");
  TextEditingController textEditingControllerPassword =
      TextEditingController(text: "password");

  final _userName = "username";
  final _mail = "mail@gmail.com";
  final _password = "password";

  late UserInfo userInfo;

/*
  Splash ekranı olacak. initState'inde duration methodu bitene kadar çalışacak splash. Sonrasında sayfa yönlendirmesi olacak.
  getUserInfoUsecase çalıştırılacak öncesinde buradan dönen type'a göre sayfa yönlendirilmesi yapılacak.
  Eğer userinfo verisi var ise homepage sayfasına yönlendirilecek.
  Eğer failure döner ise loginpage sayfasına yönlendirilecek.
*/

  void logIn() async {
    final getUserInfoEither = await getUserInfoUsecase(LocalKeys.cacheuserinfo);
    getUserInfoEither.fold((failure) async {
      if (condition) {
        userInfo = UserInfoModel(
          userName: textEditingControllerUserName.text,
          mail: textEditingControllerMail.text,
          password: textEditingControllerPassword.text,
        );
        final cacheUserInfoEither = await cacheUserInfoUsecase(
          UserInfoModel(
            userName: textEditingControllerUserName.text,
            mail: textEditingControllerMail.text,
            password: textEditingControllerPassword.text,
          ),
        );
        cacheUserInfoEither.fold((failure) => Left(failure), (data) {
          RouteManager.routeManager.page(homePageRoute);
          return const Right(null);
        });
      }
      RouteManager.routeManager.page(loginPageRoute);
      return Left(failure);
    }, (data) {
      userInfo = data;
      RouteManager.routeManager.page(homePageRoute);

      return Right(data);
    });
  }

  bool get condition =>
      textEditingControllerUserName.text == _userName &&
      textEditingControllerMail.text == _mail &&
      textEditingControllerPassword.text == _password;
}
