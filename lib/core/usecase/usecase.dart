import 'package:dartz/dartz.dart';
import 'package:local_data_source/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  NoParams();
}
