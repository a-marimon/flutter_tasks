part of 'counter_b_cubit.dart';

@immutable
abstract class CounterBState {
  final int value;
  final Failure? error;

  const CounterBState(this.value, [this.error]);
}

class CounterBInitial extends CounterBState {
  const CounterBInitial(super.value);
}

class CounterBLoaded extends CounterBState {
  const CounterBLoaded(super.value);
}

class CounterBLoading extends CounterBState {
  const CounterBLoading(super.value);
}

class CounterBError extends CounterBState {
  const CounterBError(super.value, super.error);
}
