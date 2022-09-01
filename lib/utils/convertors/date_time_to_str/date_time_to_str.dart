import '../../../service_locator/injection_container.dart';
import 'convert_to_ymmmd.dart';
import 'convert_to_ymmmd_add_jms.dart';

class DateTimeToStr {
  const DateTimeToStr._();

  static String convertToYMMMD(DateTime dateTime) {
    return sl.get<ConvertToYMMMD>()(dateTime);
  }

  static String convertToYMMMDAddJMS(DateTime dateTime) {
    return sl.get<ConvertToYMMMDAddJMS>()(dateTime);
  }
}
