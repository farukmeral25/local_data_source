import 'package:local_data_source/core/keys/global_key.dart';
import 'package:local_data_source/core/utils/route_manager/domain/repository/i_route_manager.dart';

class RouteManager implements IRouteManager {
  static RouteManager routeManager = RouteManager._init();
  RouteManager._init();

  @override
  Future page(String routeName, {Object? argument}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!
          .pushNamed(routeName, arguments: argument);
    }
  }

  @override
  Future pageAndReplace(String routeName, {Object? argument}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!
          .pushReplacementNamed(routeName, arguments: argument);
    }
  }

  @override
  Future pageAndRemoveUntil(String routeName, {Object? argument}) async {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return await GlobalContextKey.instance.globalKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false,
              arguments: argument);
    }
  }

  @override
  back(String routeName, {Object? argument}) {
    if (GlobalContextKey.instance.globalKey.currentState != null) {
      return GlobalContextKey.instance.globalKey.currentState!.pop(argument);
    }
  }
}
