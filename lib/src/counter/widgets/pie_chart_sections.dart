import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/src/counter/data/pie_data.dart';

List<PieChartSectionData> getSections(
        {required int counterA, required int counterB}) =>
    PieData(counterA: counterA, counterB: counterB)
        .getData()
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final value = PieChartSectionData(
            color: data.color,
            value: data.percent,
            title: '${index == 0 ? 'A: ' : 'B: '}${data.percent.toString()}',
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
