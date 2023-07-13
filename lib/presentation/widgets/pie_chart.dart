import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';
import 'package:my_tasks/domain/entity/dash/dash_entity.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocDash = context.watch<DashBloc>();
    final scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (_, contrain) {
        if (blocDash.state is DashReadyState) {
          List<DashEntity> list = (blocDash.state as DashReadyState).list;
          return list.isEmpty
              ? const Center(
                  child: Text(
                    "Sin registro de contadores",
                    textAlign: TextAlign.center,
                  ),
                )
              : PieChart(
                  PieChartData(
                    sections: list
                        .map(
                          (e) => PieChartSectionData(
                            showTitle: true,
                            titlePositionPercentageOffset: 1.3,
                            badgeWidget: Text(e.current().toString(), style: TextStyle(color: scheme.background)),
                            value: e.current().toDouble(),
                            title: e.name,
                            color: _getColor(e.name),
                            radius: contrain.maxWidth / 4,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        .toList(),
                    borderData: FlBorderData(show: true),
                    sectionsSpace: 0,
                    centerSpaceRadius: 5,
                    centerSpaceColor: Theme.of(context).cardColor,
                  ),
                );
        }
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      },
    );
  }

  _getColor(String name) {
    return nameCounters.firstWhere((element) => element['name'] == name)['color'];
  }
}
