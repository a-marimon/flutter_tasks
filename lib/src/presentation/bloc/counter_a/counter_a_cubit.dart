import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';
import 'package:my_tasks/src/domain/repositories/counter_repository.dart';

part 'counter_a_state.dart';

@injectable
class CounterACubit extends Cubit<CounterAState> {
  final CounterRepository counterRepository;

  CounterACubit(this.counterRepository) : super(const CounterAInitial(0));

  void increment() {
    emit(CounterAInitial(state.value + 1));
    counterRepository.increment(CounterModel(name: 'a', value: state.value));
  }

  Future<void> getValue() async {
    emit(CounterALoading(0));
    final value = await counterRepository.getValue('a');
    emit(CounterAInitial(value));
  }

  void decrement() {
    emit(CounterAInitial(state.value - 1));
    counterRepository.decrement(CounterModel(name: 'a', value: state.value));
  }
}
