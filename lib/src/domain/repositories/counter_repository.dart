import 'package:dartz/dartz.dart';
import 'package:my_tasks/src/core/exception/exception.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';

abstract class CounterRepository {
  Future<Either<Failure, int>> getValue(String name);
  Future<Either<Failure, void>> increment(CounterModel counter);
  Future<Either<Failure, void>> decrement(CounterModel counter);
}
