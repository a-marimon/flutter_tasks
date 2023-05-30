import 'package:dartz/dartz.dart';
import 'package:my_tasks/src/core/exception/exception.dart';

abstract class UserRepository {
  Future<Either<Failure,void>> createUser(String id);
}
