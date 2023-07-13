import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoImpl {
  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> get deviceId async {
    String deviceId = 'Unknown';
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceId = '${androidInfo.model}${androidInfo.device}';
    }
    if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    }
    return deviceId;
  }

  static Future<int> get deviceSDK async {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    int deviceSDK = androidInfo.version.sdkInt;
    return deviceSDK;
  }
}
