import 'package:flutter/material.dart';
import 'package:my_tasks/device/herlpers/device/device.dart';

class SettingsPage extends StatelessWidget {
  static String pageName = 'SettingsPage';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<String>(
              future: DeviceInfoImpl.deviceId,
              builder: (_, snap) {
                return ListTile(
                  leading: snap.data == null ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.android),
                  title: const Text("Device ID"),
                  subtitle: Text(snap.data ?? ""),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
