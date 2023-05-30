import 'package:my_tasks/src/domain/models/counter_model.dart';

abstract class CounterRepository {
  Future<int> getValue(String name);
  Future<void> increment(CounterModel counter);
  Future<void> decrement(CounterModel counter);
}
