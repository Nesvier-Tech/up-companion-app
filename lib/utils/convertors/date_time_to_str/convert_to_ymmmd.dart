import 'package:intl/intl.dart';

/// ICU Name: YEAR_ABBR_MONTH_DAY
/// Skeleton: yMMMd
/// Ref: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
class ConvertToYMMMD {
  const ConvertToYMMMD();

  String call(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }
}
