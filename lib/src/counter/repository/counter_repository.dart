import 'package:my_tasks/src/counter/constants/counter_enum.dart';
import 'package:my_tasks/src/counter/data/counter_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CounterRepository {
  final Supabase supabase;
  const CounterRepository(this.supabase);

  Future<Map<String, dynamic>?> initData() async {
    try {
      //* Se declara esta variable para devolver al bloc el listado y el valor actual del contador
      final Map<String, dynamic> counterResponse = {
        "counterA": null,
        "counterB": null,
        "listCounterA": [],
        "listCounterB": [],
      };

      counterResponse['counterA'] =
          await selectCurrentCounter(CounterEnum.counterA);
      counterResponse['counterB'] =
          await selectCurrentCounter(CounterEnum.counterB);

      Map<String, dynamic>? listCounter = await getListCounter();
      counterResponse['listCounterA'] =
          listCounter == null ? [] : listCounter['listCounterA'];
      counterResponse['listCounterB'] =
          listCounter == null ? [] : listCounter['listCounterB'];

      return counterResponse;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getListCounter() async {
    try {
      //* Se declara esta variable para devolver al bloc el listado y el valor actual del contador
      final Map<String, dynamic> counterResponse = {
        "listCounterA": null,
        "listCounterB": null
      };
      final listCounterA = await supabase.client
          .from('counter_a')
          .select('*')
          .order('id', ascending: true);

      List<CounterDto> listCountersA = [];

      for (var value in listCounterA) {
        listCountersA.add(CounterDto.fromJson(value));
      }
      counterResponse['listCounterA'] = listCountersA;

      final listCounterB = await supabase.client
          .from('counter_b')
          .select('*')
          .order('id', ascending: true);

      List<CounterDto> listCountersB = [];

      for (var value in listCounterB) {
        listCountersB.add(CounterDto.fromJson(value));
      }
      counterResponse['listCounterB'] = listCountersB;
      return counterResponse;
    } catch (e) {
      return null;
    }
  }

  Future<CounterDto> selectCurrentCounter(CounterEnum counterEnum) async {
    final counter = await supabase.client
        .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
        .select('*')
        .match({'current': 'true'}).single();

    return CounterDto.fromJson(counter);
  }

  Future<List<CounterDto>> selectPreviousCounters(
      CounterEnum counterEnum) async {
    final values = await supabase.client
        .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
        .select('*')
        .match({'current': 'false'}).order('id', ascending: true);

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
      final currentCounterValue = await selectCurrentCounter(counterEnum);
      final newValue = await supabase.client
          .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
          .insert(
              {'value': currentCounterValue.value! + 1, 'operation': 'suma'})
          .select()
          .single();

      await updateCounter(counterEnum, currentCounterValue.id!);
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
      final counterValue = await selectCurrentCounter(counterEnum);
      final newValue = await supabase.client
          .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
          .insert({'value': counterValue.value! - 1, 'operation': 'resta'})
          .select()
          .single();

      await updateCounter(counterEnum, counterValue.id!);
      final previousCounters = await selectPreviousCounters(counterEnum);

      counterResponse['listCounter'] = previousCounters;
      counterResponse['currentCounter'] = CounterDto.fromJson(newValue);
      return counterResponse;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> updateCounter(CounterEnum counterEnum, int idCounter) async {
    await supabase.client
        .from(counterEnum == CounterEnum.counterA ? 'counter_a' : 'counter_b')
        .update({'current': false}).eq('id', idCounter);
  }
}
