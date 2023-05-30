import 'package:intl/intl.dart';

class Utils {
  static formatDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }
  static formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }
}
