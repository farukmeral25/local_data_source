import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/entity/main_endpoints.dart';
import 'package:local_data_source/core/utils/remote_data_source/domain/usecase/remote_get_usecase.dart';
import 'package:local_data_source/feature/home/data/model/todo_model.dart';
import 'package:local_data_source/feature/home/domain/entity/todo.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/feature/home/domain/repository/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  late final RemoteGetUsecase _remoteGetUsecase;

  TodoRepository(Ref _ref)
      : _remoteGetUsecase = _ref.read(remoteGetUsecaseProvider);
  @override
  Future<Either<Failure, List<Todo>>> fetchTodos() async {
    final fetchTodoEither = await _remoteGetUsecase(MainEndpoint.fetchTodos);
    return fetchTodoEither.fold((failure) => Left(failure), (data) {
      List jsonData = json.decode(data);
      List<Todo> todos =
          jsonData.map((todo) => TodoModel.fromMap(todo)).toList();
      return Right(todos);
    });
  }
}
