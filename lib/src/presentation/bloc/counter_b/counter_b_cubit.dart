import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/core/exception/exception.dart';

import '../../../domain/models/counter_model.dart';
import '../../../domain/repositories/counter_repository.dart';

part 'counter_b_state.dart';

@injectable
class CounterBCubit extends Cubit<CounterBState> {
  final CounterRepository counterRepository;

  CounterBCubit(this.counterRepository) : super(const CounterBInitial(0));

  void increment() {
    emit(CounterBLoaded(state.value + 1));
    counterRepository.increment(CounterModel(name: 'b', value: state.value));
  }

  Future<void> getValue() async {
    emit(const CounterBLoading(0));

    final response = await counterRepository.getValue('b');

    response.fold(
      (error) => emit(CounterBError(0, error)),
      (value) => emit(CounterBLoaded(value)),
    );
  }

  void decrement() {
    if (state.value > 0) {
      emit(CounterBLoaded(state.value - 1));
      counterRepository.decrement(CounterModel(name: 'b', value: state.value));
    }
  }
}
