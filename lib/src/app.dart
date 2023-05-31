import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/data/device/device_detail.dart';
import 'package:my_tasks/src/ui/pages/count_one/count_one_page.dart';
import 'package:my_tasks/src/ui/pages/count_two/count_two_page.dart';
import 'package:my_tasks/src/ui/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) => HomePage(),
      ),
      GoRoute(
        path: '/count1',
        builder: (_, state) => CountOnePage(),
      ),
      GoRoute(
        path: '/count2',
        builder: (_, state) => CountTwoPage(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getDetail();
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }

  Future<void> getDetail() async {
    DeviceDetails deviceDetails = DeviceDetails();
    await deviceDetails.getDeviceDetails();
    print(deviceDetails.deviceId);
  }
}
