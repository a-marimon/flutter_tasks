import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceDetails {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String deviceId;

  Future<void> getDeviceDetails() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }
  }
}
