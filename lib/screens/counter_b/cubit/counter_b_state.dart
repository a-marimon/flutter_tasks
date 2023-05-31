part of 'counter_b_cubit.dart';

@immutable
class CounterBState {
  final bool isLoading;
  final int counter;

  CounterBState({
    this.isLoading = false,
    counter,
  }) : counter = Preferences.getInt('B') ?? 0;

  CounterBState copyWith({
    bool? isLoading,
    int? counter,
  }) =>
      CounterBState(
          isLoading: isLoading ?? this.isLoading,
          counter: counter ?? this.counter);
}
