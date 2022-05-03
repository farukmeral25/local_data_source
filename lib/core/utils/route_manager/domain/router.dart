import 'package:flutter/cupertino.dart';
import 'package:local_data_source/core/utils/route_manager/domain/entity/route.dart';
import 'package:local_data_source/feature/credential/view/login_page.dart';
import 'package:local_data_source/feature/home/view/page/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    case homePageRoute:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}
