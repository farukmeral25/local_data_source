import 'package:flutter/material.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Data Source"),
      ),
      body: Consumer(
        builder: ((context, CredentialProvider credentialProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: credentialProvider.textEditingControllerUserName,
                  decoration: const InputDecoration(
                    hintText: "User Name",
                  ),
                ),
                TextField(
                  controller: credentialProvider.textEditingControllerMail,
                  decoration: const InputDecoration(
                    hintText: "Mail",
                  ),
                ),
                TextField(
                  controller: credentialProvider.textEditingControllerPassword,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      credentialProvider.logIn();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Log In"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
