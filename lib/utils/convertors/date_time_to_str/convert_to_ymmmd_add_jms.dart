import 'package:intl/intl.dart';

class ConvertToYMMMDAddJMS {
  const ConvertToYMMMDAddJMS();

  String call(DateTime dateTime) {
    return DateFormat.yMMMd().add_jms().format(dateTime);
  }
}
