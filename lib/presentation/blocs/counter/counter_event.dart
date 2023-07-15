part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterLoadEvent extends CounterEvent {
  const CounterLoadEvent();
}

class CounterReLoadEvent extends CounterEvent {
  const CounterReLoadEvent();
}

class CounterAddEvent extends CounterEvent {
  final int pas;

  const CounterAddEvent({this.pas = 1});
}

class CounterDelEvent extends CounterEvent {
  final int pas;

  const CounterDelEvent({this.pas = 1});
}
