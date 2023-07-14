import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error_page.dart';
import 'package:my_tasks/presentation/widgets/error/unknown_error_page.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (_, contrain) => BlocBuilder<DashBloc, DashState>(builder: (ctx, state) {
        switch (state.runtimeType) {
          case DashInitialState:
            return _buildLoadingState();

          case DashReadyState:
            return _buildReadyState(state as DashReadyState, constraints: contrain, scheme: scheme);

          case DashErrorState:
            return _buildErrorState(context, state as DashErrorState);

          case DashUnknownErrorState:
            return _buildUnknownErrorState(context, state as DashUnknownErrorState);

          default:
            return _buildLoadingState();
        }
      }),
    );
  }

  _buildLoadingState() => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );

  _buildReadyState(DashReadyState state, {required BoxConstraints constraints, required ColorScheme scheme}) {
    return PieChart(
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

  _buildErrorState(BuildContext context, DashErrorState state) => MyExceptionErrorWidget(
        exception: state.exception,
        detail: 'PieChart',
        callBack: () {
          context.read<DashBloc>().add(DashRefreshEvent());
        },
      );

  _buildUnknownErrorState(BuildContext context, DashUnknownErrorState state) => UnknownErrorWidget(
        exception: state.exception,
        stackTrace: state.stackTrace,
        detail: 'PieChart',
        callBack: () {
          context.read<DashBloc>().add(DashRefreshEvent());
        },
      );
}
