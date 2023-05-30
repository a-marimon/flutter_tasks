import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_b_state.dart';

class CounterBCubit extends Cubit<int> {
  CounterBCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
