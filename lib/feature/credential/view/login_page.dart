import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/view_model_module.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_view_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CredentialViewModel credentialViewModel =
        ref.read(credentialViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Data Source"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: credentialViewModel.textEditingControllerUserName,
              decoration: const InputDecoration(
                hintText: "User Name",
              ),
            ),
            TextField(
              controller: credentialViewModel.textEditingControllerMail,
              decoration: const InputDecoration(
                hintText: "Mail",
              ),
            ),
            TextField(
              controller: credentialViewModel.textEditingControllerPassword,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                onTap: () {
                  credentialViewModel.logIn();
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
      ),
    );
  }
}
