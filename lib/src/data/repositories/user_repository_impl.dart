import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/data/datasource/user_data_source.dart';
import 'package:my_tasks/src/domain/repositories/user_repository.dart';

import '../../core/exception/exception.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, void>> createUser(String id) async {
    try {
      final bool userExist = await userDataSource.userExist(id);

      if (!userExist) {
        await userDataSource.createCollections(id);
      }
      return const Right(null);
    } on SocketException {
      return Left(InternetFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
