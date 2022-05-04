import 'package:flutter/material.dart';
import 'package:local_data_source/core/keys/global_key.dart';
import 'package:local_data_source/core/utils/route_manager/domain/router.dart'
    as router;
import 'package:local_data_source/feature/credential/view/splash_page.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_provider.dart';
import 'package:provider/provider.dart';
import 'core/init/get_it.dart' as service;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CredentialProvider>(
            create: (_) => service.getIt()),
      ],
      child: const LocalDataApp(),
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
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
