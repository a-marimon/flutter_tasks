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
}
