import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/src/counter/bloc/counter_bloc.dart';
import 'package:my_tasks/src/counter/repository/counter_repository.dart';
import 'package:my_tasks/src/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zmp5a2Fsdnpkam1lcGhkeGRhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU1NzM2MzgsImV4cCI6MjAwMTE0OTYzOH0.pQMDkO6goy7XC3uxsiQAAjz0tq0mgFpAlJ4k7rXQFu4',
      url: 'https://fvfjykalvzdjmephdxda.supabase.co');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final goRouter = router;
    return BlocProvider(
      create: (context) => CounterBloc(CounterRepository(Supabase.instance)),
      child: MaterialApp.router(
        title: 'Flutter Counter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
