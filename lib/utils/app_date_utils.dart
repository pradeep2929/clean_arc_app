import 'package:date_time_format/date_time_format.dart';
import 'package:intl/intl.dart';

class AppDateUtils {
  static String getTimeDifferenceToCurrent(String? date) {
    final dateTime = DateTime.now();
    DateTime tempDate = new DateFormat("dd/MM/yyyy hh:mm:ss").parse(date ?? dateTime.toString());
    final timeOffset = dateTime.add(Duration(
        days: tempDate.day, hours: tempDate.hour, minutes: tempDate.minute));
    return DateTimeFormat.relative(timeOffset);
  }
}
