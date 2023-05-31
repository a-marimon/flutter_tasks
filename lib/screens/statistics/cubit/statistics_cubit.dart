import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_tasks/models/history_counter_model.dart';
import 'package:my_tasks/services/firebase_services.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(const StatisticsState());

  ///Método encargado de retornar todo el historial de los contadores
  ///para ser mostrados en la gráfica y el historial
  Future<List<HistoryCounterModel>> getHistoryCounter() async {
    final queryDocs = await FirebaseServices.instance.getAllDocuments();
    final List<HistoryCounterModel> historyCounter = [];

    ///Ciclo encargado de pasar los objetos QueryDocumentSnapshot
    ///retornados por Firebase a HistoryCounterModel
    for (var doc in queryDocs) {
      final data = doc.data() as Map<String, dynamic>;
      historyCounter.add(HistoryCounterModel.fromMap(data));
    }
    emit(state.copyWith(historyCounter: historyCounter));
    return historyCounter;
  }

  ///Se encarga de agrupar el historial de contadores por sus atributos name
  Map<String, double> reduceListToChart() {
    Map<String, double> valuesToChart = {};

    ///Ciclo encargado de recorrer todo el listado de HistoryCounterModel
    ///y va extrayendo sus nombres para luego sumar todos su valores
    for (final history in state.historyCounter) {
      final String name = history.name!;
      if (!valuesToChart.containsKey(name)) {
        valuesToChart[name] = _sumValues(name);
      }
    }

    return valuesToChart;
  }

  ///Metodo que suma todos los valores según el contador indicado
  ///en el atributo 'counterName'
  double _sumValues(String counterName) {
    final counterValues = state.historyCounter
        .where((history) => history.name == counterName)
        .toList();
    final sum = counterValues.fold(0, (sum, next) => sum + (next.value as int));
    return sum.toDouble();
  }
}
