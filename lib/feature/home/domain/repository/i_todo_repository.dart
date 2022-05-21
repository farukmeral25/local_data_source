import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';
import 'package:local_data_source/feature/home/domain/entity/todo.dart';

abstract class ITodoRepository {
  Future<Either<Failure, List<Todo>>> fetchTodos();
}
