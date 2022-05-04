import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/view_model_module.dart';
import 'package:local_data_source/feature/splash/viewmodel/splash_view_model.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SplashViewModel _ = ref.watch(splashViewModelProvider);

    return const Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
