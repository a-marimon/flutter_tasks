part of 'statistics_cubit.dart';

@immutable
class StatisticsState {
  final List<HistoryCounterModel> historyCounter;

  const StatisticsState({this.historyCounter = const []});

  StatisticsState copyWith({List<HistoryCounterModel>? historyCounter}) =>
      StatisticsState(historyCounter: historyCounter ?? this.historyCounter);
}
