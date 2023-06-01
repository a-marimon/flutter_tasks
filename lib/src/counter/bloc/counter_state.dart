part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, error }

@immutable
class CounterState {
  final int? valueA;
  final int? valueB;
  final CounterStatus? counterStatus;
  final CounterDto? currentCounterA;
  final List<CounterDto>? listCountersA;

  factory CounterState.initial() => CounterState(
      valueA: 0,
      valueB: 0,
      counterStatus: CounterStatus.initial,
      currentCounterA: CounterDto.initial(),
      listCountersA: const []);
  const CounterState(
      {this.valueA,
      this.valueB,
      this.counterStatus,
      this.currentCounterA,
      this.listCountersA});

  CounterState copyWith({
    final int? valueA,
    final int? valueB,
    final CounterStatus? counterStatus,
    final CounterDto? currentCounterA,
    final List<CounterDto>? listCountersA,
  }) {
    return CounterState(
      valueA: valueA ?? this.valueA,
      valueB: valueB ?? this.valueB,
      currentCounterA: currentCounterA ?? this.currentCounterA,
      counterStatus: counterStatus ?? this.counterStatus,
      listCountersA: listCountersA ?? this.listCountersA,
    );
  }
}
