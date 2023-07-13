part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterAddEvent extends CounterEvent {
  final int pas;

  const CounterAddEvent({this.pas = 1});
}

class CounterDelEvent extends CounterEvent {
  final int pas;

  const CounterDelEvent({this.pas = 1});
}

class CounterLoadEvent extends CounterEvent {
  final int offset;
  final int limit;

  const CounterLoadEvent({this.offset = 0, this.limit = 10});
}
