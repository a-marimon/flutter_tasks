part of 'counter_b_cubit.dart';

@immutable
abstract class CounterBState {
  final int value;

  const CounterBState(this.value);
}

class CounterBInitial extends CounterBState {
  const CounterBInitial(super.value);
}

class CounterBLoading extends CounterBState {
  const CounterBLoading(super.value);
}
