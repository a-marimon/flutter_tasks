import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/views/page1.dart';
import 'package:my_tasks/src/views/page2.dart';

enum AppRouter { page1, page2 }

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.page1.name,
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: '/two',
      name: AppRouter.page2.name,
      builder: (context, state) => const Page2(),
    ),
  ],
);
