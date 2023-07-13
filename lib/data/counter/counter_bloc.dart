import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/data/counter/counter_repository.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';
import 'package:my_tasks/device/init.dart';

import 'package:my_tasks/domain/entity/counter/counter_entity.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final String name;
  late CounterRepository repository;

  factory CounterBloc.fromId(String counterName) {
    return CounterBloc(name: counterName);
  }

  CounterBloc({required this.name}) : super(CounterInitialState()) {
    repository = CounterRepository(counterName: name);
    on<CounterEvent>((event, emit) async {
      if (state is CounterInitialState) {
        CounterEntity? last = await repository.last();
        emit(CounterReadyState(entity: last ?? CounterEntity(name: name, operation: '', current: 0, datetime: DateTime.now(), id: 0)));
      }
      if (state is CounterReadyState) {
        CounterEntity last = (state as CounterReadyState).entity;
        emit((state as CounterReadyState).copyWith(request: true));
        CounterEntity? entity;
        if (event is CounterAddEvent) {
          entity = await repository.save(name: name, operation: '+', value: (last.id == 0 ? 0 : last.current) + (event.pas));
        }
        if (event is CounterDelEvent) {
          entity = await repository.save(name: name, operation: '-', value: (last.id == 0 ? 0 : last.current) - (event.pas));
        }
        emit((state as CounterReadyState).copyWith(entity: entity ?? last));
      }
      Utils.currentContext()?.read<DashBloc>().add(DashRefreshEvent());
    });
  }
}
