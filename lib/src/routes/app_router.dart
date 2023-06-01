import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/counter/constants/counter_enum.dart';
import 'package:my_tasks/src/counter/views/page1.dart';
import 'package:my_tasks/src/counter/views/page2.dart';
import 'package:my_tasks/src/counter/views/page3.dart';

enum AppRouter { page1, page2, page3 }

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.page1.name,
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: '/page2',
      name: AppRouter.page2.name,
      builder: (context, state) => const Page2(),
    ),
    GoRoute(
        path: '/page3:counterValue',
        name: AppRouter.page3.name,
        builder: (context, state) {
          final counterEnum =
              state.pathParameters['counterValue'] ?? 'counterA';
          print(counterEnum.toLowerCase().compareTo('countera') == 0);
          return Page3(
              counterEnum: counterEnum.toLowerCase().compareTo('countera') == 0
                  ? CounterEnum.counterA
                  : CounterEnum.counterB);
        }),
  ],
);
