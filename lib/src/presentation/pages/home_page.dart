import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/data/datasource/counter_data_source.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';
import 'package:my_tasks/src/domain/models/event_model.dart';
import 'package:my_tasks/src/presentation/pages/widgets/event_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CounterPieChart(),
            SizedBox(
              width: double.maxFinite,
              height: 40.0,
            ),
            Events()
          ],
        ),
      ),
    );
  }
}

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late CounterDataSource dataSource;

  @override
  void initState() {
    dataSource = getIt<CounterDataSource>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: dataSource.getEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Error al obtener los datos de Firebase');
        }

        final data = snapshot.data!;

        if (data.size > 0) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.size,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final document = data.docs.reversed.toList()[index];
              final event = EventModel.fromMap(document.data());

              return EventWidget(event: event);
            },
          );
        } else {
          return const Text('No hay eventos');
        }
      },
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

        Map<String, double> map = {};

        if (snapshot.data!.docs.isNotEmpty) {
          final list = snapshot.data!.docs
              .map((e) => CounterModel.fromMap(e.data()))
              .toList();

          for (var element in list) {
            map.addAll(element.toMap());
          }
        } else {
          map = {
            'Contador A': 0,
            'Contador B': 0,
          };
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
