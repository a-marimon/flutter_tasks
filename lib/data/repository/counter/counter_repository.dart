import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/domain/entity/entity.dart';

class CounterRepository {
  final String counterName;

  CounterRepository({required this.counterName});

  Future<PaginatorResponse<CounterEntity>> find({int offset = 0, int limit = 10}) async {
    return await Utils.http.counters(counterName, offset, limit);
  }

  Future<CounterEntity?> last() async {
    try {
      return await Utils.http.lastCounter(counterName);
    } catch (e) {
      throw MyException.checkError(e);
    }
  }

  Future<CounterEntity?> save({required String name, required String operation, required int value}) async {
    try {
      return await Utils.http.addCounter(name: name, current: value, operation: operation);
    } catch (e) {
      throw MyException.checkError(e);
    }
  }
}
