import 'dart:convert';

import 'package:local_data_source/feature/credential/domain/entity/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({
    required String userName,
    required String mail,
    required String password,
  }) : super(
          userName: userName,
          mail: mail,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'mail': mail,
      'password': password,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      userName: map['userName'] ?? '',
      mail: map['mail'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source));
}
