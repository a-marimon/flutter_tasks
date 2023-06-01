import 'package:flutter/material.dart';

class PieData {
  final int counterA;
  final int counterB;
  PieData({required this.counterA, required this.counterB});

  List<Data> getData() {
    return [
      Data(
          name: 'Contador A',
          percent: double.parse(counterA.toString()),
          color: const Color(0xff0293ee)),
      Data(
          name: 'Contador B',
          percent: double.parse(counterB.toString()),
          color: const Color.fromARGB(255, 184, 28, 28)),
    ];
  }
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}
