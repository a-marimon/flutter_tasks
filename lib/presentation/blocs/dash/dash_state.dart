part of 'dash_bloc.dart';

@immutable
abstract class DashState {
  const DashState();
}

class DashInitialState extends DashState {}

class DashReadyState extends DashState {
  final List<DashEntity> list;

  const DashReadyState({required this.list});

  List<Object?> get props => [list];

  DashReadyState copyWith({
    List<DashEntity>? list,
  }) {
    return DashReadyState(list: list ?? this.list);
  }

  operationCounts(String counterName) {
    int index = list.indexWhere((element) => element.name == counterName);
    int operationCounts = 0;
    if (index != -1) {
      operationCounts = list[index].count;
    }
    return operationCounts;
  }
}

class DashErrorState extends DashState {
  final MyException exception;

  const DashErrorState({required this.exception});
}

class DashUnknownErrorState extends DashState {
  final Exception exception;
  final StackTrace stackTrace;

  const DashUnknownErrorState({required this.exception, required this.stackTrace});
}
