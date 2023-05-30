import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/counter_model.dart';
import '../../../domain/repositories/counter_repository.dart';

part 'counter_b_state.dart';

@injectable
class CounterBCubit extends Cubit<CounterBState> {
  final CounterRepository counterRepository;

  CounterBCubit(this.counterRepository) : super(const CounterBInitial(0));

  void increment() {
    emit(CounterBInitial(state.value + 1));
    counterRepository.increment(CounterModel(name: 'b', value: state.value));
  }

  Future<void> getValue() async {
    emit(const CounterBLoading(0));
    final value = await counterRepository.getValue('b');
    emit(CounterBInitial(value));
  }

  void decrement() {
    emit(CounterBInitial(state.value - 1));
    counterRepository.decrement(CounterModel(name: 'b', value: state.value));
  }
}
