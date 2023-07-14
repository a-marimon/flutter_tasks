import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  static String pageName = 'CounterPage';

  const CounterPage({Key? key, required this.counterName}) : super(key: key);

  final String counterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(counterName),
      ),
    );
  }
}
