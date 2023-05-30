import 'package:bloc/bloc.dart';

class CounterBCubit extends Cubit<int> {
  CounterBCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
