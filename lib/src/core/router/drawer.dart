import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/core/router/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Contador A'),
                onTap: () {
                  context.goNamed(AppRouter.counterA.name);
                  context.pop();
                },
              ),
              ListTile(
                title: const Text('Contador B'),
                onTap: () {
                  context.goNamed(AppRouter.counterB.name);
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
