import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (_, constraints) => BlocBuilder<DashBloc, DashState>(builder: (ctx, state) {
        switch (state.runtimeType) {
          case DashInitialState:
            return _buildLoadingState(constraints: constraints);

          case DashReadyState:
            return _buildReadyState(state as DashReadyState, constraints: constraints, scheme: scheme);

          case DashErrorState:
            return buildErrorState(context, (state as DashErrorState).exception, small: true);

          case DashUnknownErrorState:
            return buildUnknownErrorState(context, (state as DashUnknownErrorState).exception, state.stackTrace, small: true);

          default:
            return _buildLoadingState(constraints: constraints);
        }
      }),
    );
  }

  _buildLoadingState({required BoxConstraints constraints}) => Center(
        child: Skeletonizer(
          enabled: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Counter"),
              CircleAvatar(
                radius: constraints.maxWidth / 3.5,
              ),
              const Text("Counter"),
            ],
          ),
        ),
      );

  _buildReadyState(DashReadyState state, {required BoxConstraints constraints, required ColorScheme scheme}) {
    return state.list.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Text(
                "No register of meters",
                textAlign: TextAlign.center,
              ),
            ),
          )
        : PieChart(
            PieChartData(
              sections: state.list
                  .map(
                    (e) => PieChartSectionData(
                      showTitle: true,
                      titlePositionPercentageOffset: 1.3,
                      badgeWidget: Text(e.current().toString(), style: TextStyle(color: scheme.background)),
                      value: e.current().toDouble(),
                      title: e.name,
                      color: Utils.getCounterColor(e.name),
                      radius: constraints.maxWidth / 4,
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
              centerSpaceColor: scheme.onBackground,
            ),
          );
  }
}
