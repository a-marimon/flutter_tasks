import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/src/counter/const/counter_enum.dart';
import 'package:my_tasks/src/counter/data/counter_dto.dart';
import 'package:my_tasks/src/counter/repository/counter_repository.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(this.counterRepository) : super(CounterState.initial()) {
    on<CounterAddA>(_addCounterA);
    on<CounterDecrementA>(_decrementCounterA);
    on<CounterAddB>(_addCounterB);
    on<CounterDecrementB>(_decrementCounterB);
  }

  final CounterRepository counterRepository;

  void _addCounterA(CounterAddA event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counterStatus: CounterStatus.loading));

    Map<String, dynamic>? counterResponse =
        await counterRepository.addCounter(CounterEnum.counterA);
    if (counterResponse != null) {
      emit(state.copyWith(
          valueA: state.valueA! + 1,
          counterStatus: CounterStatus.success,
          currentCounterA: counterResponse['currentCounter']));
    } else {
      emit(state.copyWith(counterStatus: CounterStatus.error));
    }
  }

  void _decrementCounterA(
      CounterDecrementA event, Emitter<CounterState> emit) async {
    if (state.currentCounterA!.value != 0) {
      emit(state.copyWith(counterStatus: CounterStatus.loading));

      Map<String, dynamic>? counterResponse =
          await counterRepository.decrementCounter(CounterEnum.counterA);
      if (counterResponse != null) {
        emit(state.copyWith(
            valueA: state.valueA! - 1,
            counterStatus: CounterStatus.success,
            currentCounterA: counterResponse['currentCounter']));
      } else {
        emit(state.copyWith(counterStatus: CounterStatus.error));
      }
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
