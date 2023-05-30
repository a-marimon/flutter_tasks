part of 'counter_a_cubit.dart';

@immutable
abstract class CounterAState {
  final int value;
  final Failure? error;

  const CounterAState(this.value, [this.error]);
}

class CounterAInitial extends CounterAState {
  const CounterAInitial(super.value);
}

class CounterALoaded extends CounterAState {
  const CounterALoaded(super.value);
}

class CounterALoading extends CounterAState {
  const CounterALoading(super.value);
}

class CounterAError extends CounterAState {
  const CounterAError(super.value, super.error);
}
