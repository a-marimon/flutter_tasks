//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'cubit/statistics_cubit.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  static String routeName = 'StatisticsScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(),
      child: const _StatisticsView(),
    );
  }
}

class _StatisticsView extends StatelessWidget {
  const _StatisticsView();

  @override
  Widget build(BuildContext context) {
    return MainScaffoldWidget(
      screenTitle: 'Estadísticas',
      child: Column(
        children: [
          const _Chart(),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          Text('Historial', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          const Expanded(child: _HistoryCounter())
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatisticsCubit>();
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (_, state) {
        final listToChart = cubit.reduceListToChart();

        if (state.historyCounter.isEmpty) {
          return const _MessageIfEmptyData(
              'No hay información suficiente para conformar la gráfica');
        }
        return SizedBox(
            height: 200,
            child: PieChart(
              ringStrokeWidth: 10,
              dataMap: listToChart.isEmpty ? {'': 0} : listToChart,
            ));
      },
    );
  }
}

class _MessageIfEmptyData extends StatelessWidget {
  const _MessageIfEmptyData(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _HistoryCounter extends StatelessWidget {
  const _HistoryCounter();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StatisticsCubit>();

    return FutureBuilder(
      future: cubit.getHistoryCounter(),
      builder: (_, AsyncSnapshot<List<HistoryCounterModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator.adaptive());

          case ConnectionState.done:
            if (snapshot.hasData) {
              final history = snapshot.data!;

              if (history.isEmpty) {
                return const _MessageIfEmptyData(
                    'No hay historial para mostrar');
              }
              return ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (_, index) {
                    return _ListTile(history: history[index]);
                  });
            }
        }
        return Container();
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.history,
  });

  final HistoryCounterModel history;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomContainerWidget(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          history.name!,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              history.action!,
              style: textTheme.titleMedium,
            ),
            Text(
              '${history.value}',
              style: textTheme.titleSmall,
            )
          ],
        ),
        Text(history.lastUpdate!),
      ],
    ));
  }
}
