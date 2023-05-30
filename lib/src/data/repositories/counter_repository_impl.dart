import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/data/datasource/counter_data_source.dart';
import 'package:my_tasks/src/data/datasource/user_data_source.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';

import '../../../injection_container.dart';
import '../../core/exception/exception.dart';
import '../../core/preferences/preferences.dart';
import '../../domain/models/event_model.dart';
import '../../domain/repositories/counter_repository.dart';

@Injectable(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final CounterDataSource dataSource;
  final UserDataSource userDataSource;

  CounterRepositoryImpl(this.dataSource, this.userDataSource);

  @override
  Future<Either<Failure, void>> decrement(CounterModel counter) async {
    try {
      final id = getIt<Preferences>().deviceId;
      final bool userExist = await userDataSource.userExist(id);

      if (!userExist) {
        await userDataSource.createCollections(id);
      }

      final event = EventModel(
        name: counter.name,
        time: DateTime.now(),
        value: counter.value,
        action: Actions.resta.name,
      );

      await Future.wait(
        [
          dataSource.decrement(counter),
          dataSource.setEvent(event),
        ],
      );

      return const Right(null);
    } on SocketException {
      return Left(InternetFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getValue(String name) async {
    try {
      final id = getIt<Preferences>().deviceId;
      final bool userExist = await userDataSource.userExist(id);

      if (!userExist) {
        await userDataSource.createCollections(id);
      }

      final counter = await dataSource.getValue(name);

      if (counter != null) {
        return Right(counter.value!);
      } else {
        return const Right(0);
      }
    } on SocketException {
      return Left(InternetFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> increment(CounterModel counter) async {
    try {
      final id = getIt<Preferences>().deviceId;
      final bool userExist = await userDataSource.userExist(id);

      if (!userExist) {
        await userDataSource.createCollections(id);
      }

      final event = EventModel(
        name: counter.name,
        time: DateTime.now(),
        value: counter.value,
        action: Actions.suma.name,
      );

      await Future.wait(
        [
          dataSource.increment(counter),
          dataSource.setEvent(event),
        ],
      );

      return const Right(null);
    } on SocketException {
      return Left(InternetFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
