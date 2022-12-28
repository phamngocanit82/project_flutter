import 'package:intl/intl.dart';

String dateFormatYYYYMMdd(DateTime date) {
  DateFormat s = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", 'en-US');
  return s.format(date);
}

DateTime convertStringToDate(String date,
    {formatData = "yyyy-MM-dd'T'HH:mm:ss.SSS"}) {
  DateFormat s = DateFormat(formatData, 'en-US');
  return s.parse(date);
}

String dateFormatDDMMYYYY(DateTime date) {
  DateFormat s = DateFormat("dd - MM -yyyy");
  return s.format(date);
}
