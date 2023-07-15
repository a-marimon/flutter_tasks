import 'package:flutter/material.dart';
import 'package:my_tasks/device/info/device_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                future: DeviceInfo.deviceId,
                builder: (_, snap) {
                  switch (snap.connectionState) {
                    case ConnectionState.done:
                      return ListTile(
                        leading: const Icon(Icons.android),
                        title: const Text("Device Id"),
                        subtitle: Text(snap.data ?? "Unknown"),
                      );
                    default:
                      return const Skeletonizer(
                        child: ListTile(
                          leading: Icon(Icons.android),
                          title: Text("DeviceId"),
                          subtitle: Text("unique device identifier"),
                        ),
                      );
                  }
                })
          ],
        ),
      ),
    );
  }
}
