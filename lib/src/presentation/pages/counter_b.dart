import 'package:flutter/material.dart';

class CounterB extends StatelessWidget {
  const CounterB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador B'),
      ),
      body: const Center(
        child: Text('Contador B'),
      ),
    );
  }
}
