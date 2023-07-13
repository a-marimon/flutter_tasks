import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/data/dash/dash_repository.dart';
import 'package:my_tasks/domain/entity/dash/dash_entity.dart';

part 'dash_event.dart';

part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  DashRepository repository = DashRepository();

  DashBloc() : super(DashInitialState()) {
    on<DashEvent>((event, emit) async {
      if (event is DashRefreshEvent) {
        if (state is DashInitialState) {
          emit(DashReadyState(list: await repository.data()));
        }
        if (state is DashReadyState) {
          emit((state as DashReadyState).copyWith(list: await repository.data()));
        }
      }
    });
  }
}
