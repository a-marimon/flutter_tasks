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

  Future<void> increment() async {
    emit(const CounterBLoading(0));

    final response = await counterRepository
        .increment(CounterModel(name: 'b', value: state.value));

    response.fold(
      (error) => emit(CounterBError(0, error)),
      (value) => emit(CounterBLoaded(state.value + 1)),
    );
  }

  Future<void> getValue() async {
    emit(const CounterBLoading(0));

    final response = await counterRepository.getValue('b');

    response.fold(
      (error) => emit(CounterBError(0, error)),
      (value) => emit(CounterBLoaded(value)),
    );
  }

  Future<void> decrement() async {
    if (state.value > 0) {
      final response = await counterRepository
          .decrement(CounterModel(name: 'b', value: state.value));

      response.fold(
        (error) => emit(CounterBError(0, error)),
        (value) => emit(CounterBLoaded(state.value - 1)),
      );
    }
  }
}
