import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<BaseDeviceInfo> get info {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return deviceInfo.deviceInfo;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
