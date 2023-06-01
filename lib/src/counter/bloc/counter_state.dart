part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int? valueA;
  final int? valueB;

  factory CounterState.initial() => const CounterState(valueA: 0, valueB: 0);
  const CounterState({this.valueA, this.valueB});

  CounterState copyWith({
    final int? valueA,
    final int? valueB,
  }) {
    return CounterState(
      valueA: valueA ?? this.valueA,
      valueB: valueB ?? this.valueB,
    );
  }
}
