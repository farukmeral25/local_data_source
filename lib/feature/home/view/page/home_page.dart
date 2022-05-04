import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/util_module.dart';
import 'package:local_data_source/core/service/view_model_module.dart';
import 'package:local_data_source/core/utils/app_user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUser appUser = ref.watch(appUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(appUser.userInfo.userName),
            Text(appUser.userInfo.mail),
            Text(appUser.userInfo.password),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                onTap: () {
                  ref.read(credentialViewModelProvider).logOut();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Log Out"),
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
