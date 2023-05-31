import 'package:flutter/material.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/services/firebase_services.dart';

import 'helpers/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.instance.init();
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes(),
    );
  }
}
