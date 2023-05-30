import 'package:flutter/material.dart';
import 'package:my_tasks/src/core/router/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
