import 'package:flutter/material.dart';
import 'package:local_data_source/core/keys/scaffold_messanger_key.dart';

void showSnackBar(
    {required String title, Color? color = Colors.red, int duration = 500}) {
  GlobalScaffoldMessangerKey.instance.globalKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: color,
      duration: Duration(milliseconds: duration),
    ),
  );
}
