part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, error }

@immutable
class CounterState {
  final int? valueA;
  final int? valueB;
  final CounterStatus? counterStatus;
  final CounterDto? currentCounterA;
  final CounterDto? currentCounterB;
  final List<CounterDto>? listCountersA;
  final List<CounterDto>? listCountersB;

  factory CounterState.initial() => CounterState(
        valueA: 0,
        valueB: 0,
        counterStatus: CounterStatus.initial,
        currentCounterA: CounterDto.initial(),
        currentCounterB: CounterDto.initial(),
      );
  const CounterState({
    this.valueA,
    this.valueB,
    this.counterStatus,
    this.currentCounterA,
    this.currentCounterB,
    this.listCountersA,
    this.listCountersB,
  });

  CounterState copyWith({
    final int? valueA,
    final int? valueB,
    final CounterStatus? counterStatus,
    final CounterDto? currentCounterA,
    final CounterDto? currentCounterB,
    final List<CounterDto>? listCountersA,
    final List<CounterDto>? listCountersB,
  }) {
    return CounterState(
      valueA: valueA ?? this.valueA,
      valueB: valueB ?? this.valueB,
      currentCounterA: currentCounterA ?? this.currentCounterA,
      currentCounterB: currentCounterB ?? this.currentCounterB,
      counterStatus: counterStatus ?? this.counterStatus,
      listCountersA: listCountersA ?? this.listCountersA,
      listCountersB: listCountersB ?? this.listCountersB,
    );
  }
}
