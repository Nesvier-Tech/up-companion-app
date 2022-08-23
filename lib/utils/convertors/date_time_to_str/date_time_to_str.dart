import '../../../service_locator/injection_container.dart';
import 'convert_to_ymmmd.dart';

class DateTimeToStr {
  const DateTimeToStr._();

  static String convertToYMMMD(DateTime dateTime) {
    return sl.get<ConvertToYMMMD>()(dateTime);
  }
}
