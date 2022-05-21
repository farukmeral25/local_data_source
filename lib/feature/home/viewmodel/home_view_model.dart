import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/service/service_modules/use_case_module.dart';
import 'package:local_data_source/core/usecase/usecase.dart';
import 'package:local_data_source/feature/home/domain/usecase/fetch_todo_usecase.dart';

class HomeViewModel {
  late final FetchTodoUsecase _fetchTodoUsecase;

  HomeViewModel(Ref _ref)
      : _fetchTodoUsecase = _ref.read(fetchTodoUsecaseProvider) {
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final fetchTodoEither = await _fetchTodoUsecase(NoParams());

    fetchTodoEither.fold((failure) => Left(failure), (todos) {
      print(todos.length);
    });
  }
}
