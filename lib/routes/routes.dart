import 'package:go_router/go_router.dart';
import 'package:my_tasks/screens/screens.dart';

GoRouter appRoutes() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: CounterAScreen.routeName,
      path: '/${CounterAScreen.routeName}',
      builder: (context, state) => const CounterAScreen(),
    ),
    GoRoute(
      name: CounterBScreen.routeName,
      path: '/${CounterBScreen.routeName}',
      builder: (context, state) => const CounterBScreen(),
    ),
    GoRoute(
      name: StatisticsScreen.routeName,
      path: '/',
      builder: (context, state) => const StatisticsScreen(),
    ),
  ]);
}
