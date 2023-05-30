import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Preferences {
  final BaseDeviceInfo device;
  final SharedPreferences prefs;

  Preferences(this.device, this.prefs);

  Future<void> setDeviceId() async {
    if (!prefs.containsKey('id')) {
      final id = device.data['id'] as String;
      await prefs.setString('id', id);
    }
  }

  String get deviceId => prefs.getString('id') ?? '';
}
