import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  title: const Text('Contador A'),
                  onTap: () => context.push('/${CounterAScreen.routeName}'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Contador B'),
                  onTap: () => context.push('/${CounterBScreen.routeName}'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Estadísticas'),
                  onTap: () => context.push('/'),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
