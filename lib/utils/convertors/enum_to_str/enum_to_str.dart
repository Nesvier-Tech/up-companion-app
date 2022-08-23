import '../../../service_locator/injection_container.dart';
import '../../constants/up_campuses.dart';
import 'convert_up_campus.dart';

class EnumToStr {
  const EnumToStr._();

  static String convertUPCampus(UPCampuses upCampus) =>
      sl<ConvertUPCampus>()(upCampus);
}
