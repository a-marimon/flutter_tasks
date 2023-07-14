import 'package:flutter/material.dart';
import 'package:my_tasks/device/theme/theme.dart';
import 'package:my_tasks/presentation/router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //THEME
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      //NAVIGATOR
      routerConfig: GoNavigator.router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const Placeholder(),
        breakpoints: [
          const Breakpoint(start: 0, end: 800, name: MOBILE),
          const Breakpoint(start: 801, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
