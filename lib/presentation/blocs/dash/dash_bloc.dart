import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/data/repository/dash/dash_respository.dart';
import 'package:my_tasks/data/repository/exepctions.dart';

import 'package:my_tasks/domain/entity/dash/dash_entity.dart';

part 'dash_event.dart';

part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  DashRepository repository = DashRepository();

  DashBloc() : super(DashInitialState()) {
    on<DashRefreshEvent>((event, emit) async {
      try {
        List<DashEntity> list = await repository.data();
        emit(DashReadyState(list: list));
      } on MyException catch (e) {
        emit(DashErrorState(exception: e));
      } on Exception catch (e) {
        emit(DashUnknownErrorState(exception: e));
      }
    });
  }
}
