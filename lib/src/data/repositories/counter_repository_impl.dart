import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/data/datasource/counter_data_source.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';

import '../../domain/models/event_model.dart';
import '../../domain/repositories/counter_repository.dart';

@Injectable(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final CounterDataSource dataSource;

  CounterRepositoryImpl(this.dataSource);

  @override
  Future<void> decrement(CounterModel counter) async {
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
  }

  @override
  Future<int> getValue(String name) async {
    final counter = await dataSource.getValue(name);

    if (counter != null) {
      return counter.value!;
    } else {
      return 0;
    }
  }

  @override
  Future<void> increment(CounterModel counter) async {
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
  }
}
