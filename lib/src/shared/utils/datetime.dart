import 'package:intl/intl.dart';

extension FormaterDateTime on DateTime {
  String format({String formato = 'dd/MM/yyyy HH:mm:ss'}) {
    return DateFormat(formato).format(this);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
