import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/presentation/pages/counter_a.dart';
import 'package:my_tasks/src/presentation/pages/counter_b.dart';
import 'package:my_tasks/src/presentation/pages/home_page.dart';

enum AppRouter {
  home,
  counterA,
  counterB,
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'a',
          name: AppRouter.counterA.name,
          builder: (context, state) => const CounterA(),
        ),
        GoRoute(
          path: 'b',
          name: AppRouter.counterB.name,
          builder: (context, state) => const CounterB(),
        ),
      ],
    ),
  ],
);
