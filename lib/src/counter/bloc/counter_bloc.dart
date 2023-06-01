import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddA>(_addCounterA);
    on<CounterDecrementA>(_decrementCounterA);
    on<CounterAddB>(_addCounterB);
    on<CounterDecrementB>(_decrementCounterB);
  }

  void _addCounterA(CounterAddA event, Emitter<CounterState> emit) {
    emit(state.copyWith(valueA: state.valueA! + 1));
  }

  void _decrementCounterA(CounterDecrementA event, Emitter<CounterState> emit) {
    if (state.valueA != 0) {
      emit(state.copyWith(valueA: state.valueA! - 1));
    }
  }

  void _addCounterB(CounterAddB event, Emitter<CounterState> emit) {
    emit(state.copyWith(valueB: state.valueB! + 1));
  }

  void _decrementCounterB(CounterDecrementB event, Emitter<CounterState> emit) {
    if (state.valueB != 0) {
      emit(state.copyWith(valueB: state.valueB! - 1));
    }
  }
}
