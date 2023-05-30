import 'package:bloc/bloc.dart';

class CounterACubit extends Cubit<int> {
  CounterACubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
