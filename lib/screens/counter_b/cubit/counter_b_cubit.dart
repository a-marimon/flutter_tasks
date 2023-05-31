import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../helpers/helpers.dart';
import '../../../models/models.dart';
import '../../../services/firebase_services.dart';

part 'counter_b_state.dart';

class CounterBCubit extends Cubit<CounterBState> {
  CounterBCubit() : super(CounterBState());

  void increment() {
    final newValue = state.counter + 1;
    final newHistory = HistoryCounterModel(
      name: 'B',
      action: CounterAction.increment,
      value: newValue,
    );
    add(newHistory);
  }

  void decrement() {
    final newValue = state.counter - 1;
    final newHistory = HistoryCounterModel(
      name: 'B',
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
