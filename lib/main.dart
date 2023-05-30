import 'package:flutter/material.dart';
import 'package:my_tasks/src/app.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt<Preferences>().setDeviceId();

  runApp(const MyApp());
}
