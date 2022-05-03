import 'package:flutter/material.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Consumer<CredentialProvider>(
          builder: (context, CredentialProvider credentialProvider, child) {
            return Column(
              children: [
                Text(credentialProvider.userInfo.userName),
                Text(credentialProvider.userInfo.mail),
                Text(credentialProvider.userInfo.password),
              ],
            );
          },
        ),
      ),
    );
  }
}
