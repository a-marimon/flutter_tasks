import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_tasks/presentation/navigator.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';
import 'package:my_tasks/device/herlpers/theme/theme.dart';
import 'package:my_tasks/device/init.dart';

import 'package:responsive_framework/responsive_framework.dart';

void main() => Utils.init().then((value) => runApp(BlocProvider(create: (_) => DashBloc(), child: const MyApp())));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //THEME
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      //NAVIGATOR
      routerDelegate: GoNavigator.router.routerDelegate,
      routeInformationParser: GoNavigator.router.routeInformationParser,
      routeInformationProvider: GoNavigator.router.routeInformationProvider,
      //RESPONSIBE
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
