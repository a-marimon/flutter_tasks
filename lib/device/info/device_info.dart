import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> get deviceId async {
    String deviceId = 'Unknown';
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceId = webBrowserInfo.userAgent ?? deviceId;
    }

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceId = '${androidInfo.model}${androidInfo.device}';
    }
    if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? deviceId;
    }

    if (Platform.isWindows) {
      final windowsInfo = await deviceInfoPlugin.windowsInfo;
      deviceId = "${windowsInfo.displayVersion}${windowsInfo.deviceId}";
    }

    if (Platform.isLinux) {
      final linuxInfo = await deviceInfoPlugin.linuxInfo;
      deviceId = linuxInfo.id;
    }

    if (Platform.isMacOS) {
      final macOsInfo = await deviceInfoPlugin.macOsInfo;
      deviceId = macOsInfo.systemGUID ?? deviceId;
    }

    return deviceId;
  }

  static Future<int> get deviceSDK async {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    int deviceSDK = androidInfo.version.sdkInt;
    return deviceSDK;
  }
}
