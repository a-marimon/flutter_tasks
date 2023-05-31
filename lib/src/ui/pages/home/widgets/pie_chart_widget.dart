import 'package:flutter/material.dart';
import 'package:my_tasks/main.dart';
import 'package:my_tasks/src/data/device/device_detail.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, double>>(
      future: getLastValue(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return PieChart(
            dataMap: snapshot.data!,
            animationDuration: const Duration(milliseconds: 500),
            chartRadius: MediaQuery
                .of(context)
                .size
                .width * 0.4,
            chartType: ChartType.disc,
            ringStrokeWidth: 10,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.left,
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
              decimalPlaces: 2,
            ),
          );
        }
      },
    );
  }

  Future<Map<String, double>> getLastValue() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    DeviceDetails deviceDetails = DeviceDetails();
    await deviceDetails.getDeviceDetails();
    final responseA = await supabase
        .from('eventos')
        .select('''
    valor
  ''')
        .eq('device_id', deviceDetails.deviceId)
        .eq('nombre_contador', 'Contador A')
        .order('id', ascending: false)
        .limit(1)
        .single()
        .execute()
        .onError((error, stackTrace) => throw error!);
    final responseB = await supabase
        .from('eventos')
        .select('''
    valor
  ''')
        .eq('device_id', deviceDetails.deviceId)
        .eq('nombre_contador', 'Contador B')
        .order('id', ascending: false)
        .limit(1)
        .single()
        .execute()
        .onError((error, stackTrace) => throw error!);
    print('A: ${responseA.data}\nB: ${responseB.data}');
    print(
        'A: ${responseA.data.toString().split(':')[1]}\nB: ${responseB.data
            .toString().split(':')[1]}');
    var countA = double.parse(
        responseA.data.toString().split(':')[1].replaceAll("}", ""));
    var countB = double.parse(
        responseB.data.toString().split(':')[1].replaceAll("}", ""));
    var map = {
      'Contador A': countA,
      'Contador B': countB,
    };
    _prefs.setInt('Contador A', countA.toInt());
    _prefs.setInt('Contador B', countB.toInt());
    return map;
  }
}
