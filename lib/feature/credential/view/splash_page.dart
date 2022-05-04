import 'package:flutter/material.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CredentialProvider>();
    return const Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
