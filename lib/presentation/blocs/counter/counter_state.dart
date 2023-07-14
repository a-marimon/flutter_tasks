part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class CounterInitialState extends CounterState {}

class CounterReadyState extends CounterState {
  final bool request;
  final CounterEntity entity;

  const CounterReadyState({required this.entity, this.request = false});

  List<Object?> get props => [entity];

  CounterReadyState copyWith({
    CounterEntity? entity,
    bool request = false,
  }) {
    return CounterReadyState(entity: entity ?? this.entity, request: request);
  }
}
