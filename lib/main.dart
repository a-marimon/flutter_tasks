import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/src/app.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';

import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();
  await getIt<Preferences>().setDeviceId();

  runApp(const MyApp());
}
