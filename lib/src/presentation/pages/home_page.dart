import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/data/datasource/counter_data_source.dart';
import 'package:my_tasks/src/data/datasource/user_data_source.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';

import 'package:pie_chart/pie_chart.dart';
import 'package:my_tasks/src/core/router/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [CounterPieChart()],
        ),
      ),
    );
  }
}

class CounterPieChart extends StatefulWidget {
  const CounterPieChart({
    super.key,
  });

  @override
  State<CounterPieChart> createState() => _CounterPieChartState();
}

class _CounterPieChartState extends State<CounterPieChart> {
  late CounterDataSource dataSource;

  @override
  void initState() {
    dataSource = getIt<CounterDataSource>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: dataSource.getCounters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Error al obtener los datos de Firebase');
        }

        final data = snapshot.data!.docs
            .map((e) => CounterModel.fromMap(e.data()))
            .toList();

        Map<String, double> map = {};
        for (var element in data) {
          map.addAll(element.toMap());
        }

        return PieChart(
          dataMap: map,
          animationDuration: const Duration(milliseconds: 800),
          chartRadius: MediaQuery.of(context).size.width * 0.4,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
        );
      },
    );
  }
}
