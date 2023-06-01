import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/routes/app_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contador B'),
            ElevatedButton(
              child: const Text('Ir al contador A'),
              onPressed: () {
                context.pushNamed(AppRouter.page1.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
