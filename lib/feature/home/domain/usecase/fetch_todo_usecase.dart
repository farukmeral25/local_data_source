import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/service/service_modules/repository_module.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/feature/home/domain/entity/todo.dart';
import 'package:local_data_source/feature/home/domain/repository/i_todo_repository.dart';

class FetchTodoUsecase implements Usecase<List<Todo>, NoParams> {
  late final ITodoRepository todoRepository;

  FetchTodoUsecase(Ref _ref)
      : todoRepository = _ref.read(todoRepositoryProvider);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await todoRepository.fetchTodos();
  }
}
