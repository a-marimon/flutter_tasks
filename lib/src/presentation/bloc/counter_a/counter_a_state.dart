part of 'counter_a_cubit.dart';

@immutable
abstract class CounterAState {
  final int value;

  const CounterAState(this.value);
}

class CounterAInitial extends CounterAState {
  const CounterAInitial(super.value);
}

class CounterALoading extends CounterAState {
  const CounterALoading(super.value);
}
