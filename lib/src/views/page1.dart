import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/routes/app_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contador A'),
            ElevatedButton(
              child: const Text('Ir al contador B'),
              onPressed: () {
                context.pushNamed(AppRouter.page2.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
