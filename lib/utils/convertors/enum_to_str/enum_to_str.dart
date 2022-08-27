import '../../../service_locator/injection_container.dart';
import '../../constants/enums/up_campuses.dart';
import 'convert_up_campus_enum_to_str.dart';

class EnumToStr {
  const EnumToStr._();

  static String convertUPCampusEnumToStr(UPCampuses upCampus) =>
      sl<ConvertUPCampusEnumToStr>()(upCampus);
}
