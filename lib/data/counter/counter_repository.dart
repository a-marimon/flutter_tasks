import 'package:flutter/material.dart';
import 'package:my_tasks/device/init.dart';
import 'package:my_tasks/domain/entity/api/api_entity.dart';
import 'package:my_tasks/domain/entity/counter/counter_entity.dart';

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
      debugPrint(e.toString());
    }

    return null;
  }

  Future<CounterEntity?> save({required String name, required String operation, required int value}) async {
    try {
      return await Utils.http.addCounter(name: name, current: value, operation: operation);
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
