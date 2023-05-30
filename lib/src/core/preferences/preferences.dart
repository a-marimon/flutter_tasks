import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Preferences {
  final BaseDeviceInfo device;
  final SharedPreferences prefs;
  final UserRepository userRepository;

  Preferences(this.device, this.prefs, this.userRepository);

  Future<void> setDeviceId() async {
    if (!prefs.containsKey('id')) {
      final id = device.data['id'] as String;
      await prefs.setString('id', id);
      await userRepository.createUser(id);
    }
  }

  String get deviceId => prefs.getString('id') ?? '';
}
