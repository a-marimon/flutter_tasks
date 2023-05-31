import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/data/device/device_detail.dart';
import 'package:my_tasks/src/ui/pages/home/widgets/events_widget.dart';
import 'package:my_tasks/src/ui/pages/home/widgets/pie_chart_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? _prefs;

  @override
  void initState() {
    _getPrefs();
    super.initState();
  }

  Future<void> _getPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    DeviceDetails deviceDetails = DeviceDetails();
    await deviceDetails.getDeviceDetails();
    _prefs?.setString('ID', deviceDetails.deviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tasks'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: FlutterLogo(),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                // Acción cuando se selecciona el Botón Inicio
                GoRouter.of(context).go('/');
                context.pop();
              },
            ),
            ListTile(
              title: const Text('Contador A'),
              onTap: () {
                // Acción cuando se selecciona el Botón 1
                GoRouter.of(context).go('/count1');
                context.pop();
              },
            ),
            ListTile(
              title: const Text('Contador B'),
              onTap: () {
                // Acción cuando se selecciona el Botón 2
                GoRouter.of(context).go('/count2');
                context.pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: const [
          PieChartWidget(),
          Flexible(child: EventsWidget()),
        ],
      ),
    );
  }
}
