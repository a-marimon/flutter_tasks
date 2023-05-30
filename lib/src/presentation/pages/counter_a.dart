import 'package:flutter/material.dart';

class CounterA extends StatelessWidget {
  const CounterA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador A'),
      ),
      body: const Center(
        child: Text('Contador A'),
      ),
    );
  }
}
