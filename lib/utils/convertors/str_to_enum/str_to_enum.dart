import '../../../service_locator/injection_container.dart';
import '../../constants/enums/up_campuses.dart';
import 'convert_up_campus_str_to_enum.dart';

class EnumToStr {
  const EnumToStr._();

  static UPCampuses convertUPCampusEnumToStr(String upCampus) =>
      sl<ConvertUPCampusStrToEnum>()(upCampus);
}
