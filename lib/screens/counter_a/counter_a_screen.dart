import 'package:flutter/material.dart';

class CounterAScreen extends StatelessWidget {
  const CounterAScreen({super.key});

  static String routeName = 'CounterAScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('CounterAScreen'),
      ),
    );
  }
}
