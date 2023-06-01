import 'package:my_tasks/src/counter/const/counter_enum.dart';
import 'package:my_tasks/src/counter/data/counter_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CounterRepository {
  final Supabase supabase;
  const CounterRepository(this.supabase);

  Future<CounterDto> selectCounter(CounterEnum counterEnum) async {
    late CounterDto counter;
    final value = await supabase.client
        .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
        .select('*')
        .match({'current': 'true'}).single();

    counter = CounterDto.fromJson(value);

    return counter;
  }

  Future<List<CounterDto>> selectPreviousCounters(
      CounterEnum counterEnum) async {
    final values = await supabase.client
        .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
        .select('*')
        .match({'current': 'false'});

    List<CounterDto> listCounters = [];

    for (var value in values) {
      listCounters.add(CounterDto.fromJson(value));
    }
    return listCounters;
  }

  Future<Map<String, dynamic>?> addCounter(CounterEnum counterEnum) async {
    //* Se declara esta variable para devolver al bloc el listado y el valor actual del contador
    final Map<String, dynamic> counterResponse = {
      "listCounter": null,
      "currentCounter": null
    };
    try {
      final currentCounterValue = await selectCounter(counterEnum);
      final newValue = await supabase.client
          .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
          .insert(
              {'value': currentCounterValue.value! + 1, 'operation': 'suma'})
          .select()
          .single();

      await updateCounter(currentCounterValue.id!);
      final previousCounters = await selectPreviousCounters(counterEnum);

      counterResponse['listCounter'] = previousCounters;
      counterResponse['currentCounter'] = CounterDto.fromJson(newValue);
      return counterResponse;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Map<String, dynamic>?> decrementCounter(
      CounterEnum counterEnum) async {
    //* Se declara esta variable para devolver al bloc el listado y el valor actual del contador
    final Map<String, dynamic> counterResponse = {
      "listCounter": null,
      "currentCounter": null
    };
    try {
      final counterValue = await selectCounter(counterEnum);
      final newValue = await supabase.client
          .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
          .insert({'value': counterValue.value! - 1, 'operation': 'resta'})
          .select()
          .single();

      await updateCounter(counterValue.id!);
      final previousCounters = await selectPreviousCounters(counterEnum);

      counterResponse['listCounter'] = previousCounters;
      counterResponse['currentCounter'] = CounterDto.fromJson(newValue);
      return counterResponse;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> updateCounter(int idCounter) async {
    await supabase.client
        .from('counter_a')
        .update({'current': false}).eq('id', idCounter);
  }
}
