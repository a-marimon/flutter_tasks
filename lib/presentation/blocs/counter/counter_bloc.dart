import 'package:meta/meta.dart';
import 'package:my_tasks/data/repository/counter/counter_repository.dart';
import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/domain/entity/entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  late CounterRepository repository;
  final String name;

  //Crear multiples instancias de CounterBloc basado en counterName
  factory CounterBloc.fromId(String counterName) {
    return CounterBloc(name: counterName);
  }

  CounterBloc({required this.name}) : super(CounterInitialState()) {
    repository = CounterRepository(counterName: name);

    on<CounterLoadEvent>((event, emit) async {
      try {
        CounterEntity? last = await repository.last();
        emit(CounterReadyState(entity: last ?? CounterEntity(name: name, operation: '', current: 0, datetime: DateTime.now(), id: 0)));
      } on MyException catch (e) {
        emit(CounterErrorState(exception: e));
      } on Exception catch (e, st) {
        emit(CounterUnknownErrorState(exception: e, stackTrace: st));
      }
    });
    on<CounterReLoadEvent>((event, emit) {
      if (state is CounterErrorState || state is CounterUnknownErrorState) {
        emit(CounterInitialState());
      }
      add(const CounterLoadEvent());
    });
    on<CounterAddEvent>((event, emit) async {
      if (state is CounterReadyState) await _operation(event.pas, emit, state as CounterReadyState, operation: '+');
    });
    on<CounterDelEvent>((event, emit) async {
      if (state is CounterReadyState) await _operation(event.pas, emit, state as CounterReadyState, operation: '-');
    });
  }

  _operation(int pass, emit, CounterReadyState state, {required String operation}) async {
    CounterEntity last = state.entity;
    emit(state.copyWith(request: true));
    late int toSum;
    CounterEntity? entity;
    switch (operation) {
      case '+':
        toSum = last.current + pass;
        entity = await repository.save(name: name, operation: '+', value: toSum);
        break;
      case '-':
        toSum = last.current - pass;
        entity = await repository.save(name: name, operation: '-', value: toSum);
        break;
      default:
        toSum = 0;
        break;
    }
    try {
      emit(state.copyWith(entity: entity ?? last));
      //Refrescar datos del DashBloc
      // Al estar en el topWidget , el context que me provee el goRouter puede acceder a ese bloc
      Utils.currentContext()?.read<DashBloc>().add(DashRefreshEvent());
    } on MyException catch (e) {
      emit(CounterErrorState(exception: e));
    } on Exception catch (e, st) {
      emit(CounterUnknownErrorState(exception: e, stackTrace: st));
    }
  }
}
