// ignore_for_file: public_member_api_docs
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  static void remove(String key) {
    _prefs.remove(key);
  }
}
