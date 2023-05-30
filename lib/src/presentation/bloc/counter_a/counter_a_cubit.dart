import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_a_state.dart';

class CounterACubit extends Cubit<int> {
  CounterACubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
