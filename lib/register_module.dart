import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FirebaseFirestore get storage => FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  @preResolve
  Future<BaseDeviceInfo> get info {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return deviceInfo.deviceInfo;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
