part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterAddA extends CounterEvent {}

class CounterDecrementA extends CounterEvent {}

class CounterAddB extends CounterEvent {}

class CounterDecrementB extends CounterEvent {}

class CounterDecrement extends CounterEvent {}
