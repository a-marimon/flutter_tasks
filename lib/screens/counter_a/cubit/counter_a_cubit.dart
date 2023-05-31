import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/models/history_counter_model.dart';
import 'package:my_tasks/services/firebase_services.dart';

import '../../../helpers/helpers.dart';

part 'counter_a_state.dart';

class CounterACubit extends Cubit<CounterAState> {
  CounterACubit() : super(CounterAState());

  void increment() {
    final newValue = state.counter + 1;
    final newHistory = HistoryCounterModel(
      name: 'A',
      action: CounterAction.increment,
      value: newValue,
    );
    add(newHistory);
  }

  void decrement() {
    final newValue = state.counter - 1;
    final newHistory = HistoryCounterModel(
      name: 'A',
      action: CounterAction.decrement,
      value: newValue,
    );
    add(newHistory);
  }

  Future<void> add(HistoryCounterModel newHistory) async {
    emit(state.copyWith(isLoading: true));
    await FirebaseServices.instance
        .addNewDocument(data: newHistory.toFirestore())
        .then((_) {
      final newValue = newHistory.value as int;
      Preferences.setInt(newHistory.name!, newValue);
      emit(
        state.copyWith(
          counter: newValue,
          isLoading: false,
        ),
      );
    }).onError((error, __) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      instanceLocator<Alerts>().showSnackBarApp(error.toString());
    });
  }
}
