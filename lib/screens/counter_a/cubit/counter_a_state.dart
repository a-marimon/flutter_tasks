part of 'counter_a_cubit.dart';

@immutable
class CounterAState {
  final bool isLoading;
  final int counter;

  CounterAState({
    this.isLoading = false,
    counter,
  }) : counter = Preferences.getInt('A') ?? 0;

  CounterAState copyWith({
    bool? isLoading,
    int? counter,
  }) =>
      CounterAState(
          isLoading: isLoading ?? this.isLoading,
          counter: counter ?? this.counter);
}
