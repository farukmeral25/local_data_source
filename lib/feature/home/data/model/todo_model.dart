import 'dart:convert';

import 'package:local_data_source/feature/home/domain/entity/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));
}
