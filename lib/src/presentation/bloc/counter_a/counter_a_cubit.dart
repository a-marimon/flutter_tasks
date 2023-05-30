import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/core/exception/exception.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';
import 'package:my_tasks/src/domain/repositories/counter_repository.dart';

part 'counter_a_state.dart';

@injectable
class CounterACubit extends Cubit<CounterAState> {
  final CounterRepository counterRepository;

  CounterACubit(this.counterRepository) : super(const CounterALoaded(0));

  Future<void> increment() async {
    emit(const CounterALoading(0));

    final response = await counterRepository
        .increment(CounterModel(name: 'a', value: state.value));

    response.fold(
      (error) => emit(CounterAError(0, error)),
      (value) => emit(CounterALoaded(state.value + 1)),
    );
  }

  Future<void> getValue() async {
    emit(const CounterALoading(0));

    final response = await counterRepository.getValue('a');

    response.fold(
      (error) => emit(CounterAError(0, error)),
      (value) => emit(CounterALoaded(value)),
    );
  }

  Future<void> decrement() async {
    emit(const CounterALoading(0));

    if (state.value > 0) {
      final response = await counterRepository
          .decrement(CounterModel(name: 'a', value: state.value));

      response.fold(
        (error) => emit(CounterAError(0, error)),
        (value) => emit(CounterALoaded(state.value - 1)),
      );
    }
  }
}
