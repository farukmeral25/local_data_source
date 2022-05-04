import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/keys/global_key.dart';
import 'package:local_data_source/core/keys/scaffold_messanger_key.dart';
import 'package:local_data_source/core/service/setup_service.dart';
import 'package:local_data_source/core/utils/route_manager/domain/router.dart'
    as router;
import 'package:local_data_source/feature/splash/view/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();

  runApp(
    const ProviderScope(
      child: LocalDataApp(),
    ),
  );
}

class LocalDataApp extends StatelessWidget {
  const LocalDataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Data Source',
      navigatorKey: GlobalContextKey.instance.globalKey,
      scaffoldMessengerKey: GlobalScaffoldMessangerKey.instance.globalKey,
      onGenerateRoute: router.generateRoute,
      home: const SplashPage(),
    );
  }
}
