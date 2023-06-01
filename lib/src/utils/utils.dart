import 'package:intl/intl.dart';

abstract class Utils {
  static String getDateFromTimestamp(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    String date = DateFormat('yyyy-MM-dd').format(dateTime);
    return date;
  }

  static String getTimeFromTimestamp(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    String time = DateFormat('HH:mm:ss').format(dateTime);
    return time;
  }
}
