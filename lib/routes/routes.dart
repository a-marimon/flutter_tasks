import 'package:go_router/go_router.dart';
import 'package:my_tasks/screens/screens.dart';

import '../helpers/helpers.dart';

GoRouter appRoutes() {
  return GoRouter(
      navigatorKey: instanceLocator<Alerts>().navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          name: CounterAScreen.routeName,
          path: '/${CounterAScreen.routeName}',
          builder: (context, state) => const CounterAScreen(),
        ),
        GoRoute(
          name: CounterBScreen.routeName,
          path: '/${CounterBScreen.routeName}',
          builder: (_, __) => const CounterBScreen(),
        ),
        GoRoute(
          name: StatisticsScreen.routeName,
          path: '/',
          builder: (_, __) => const StatisticsScreen(),
        ),
      ]);
}
