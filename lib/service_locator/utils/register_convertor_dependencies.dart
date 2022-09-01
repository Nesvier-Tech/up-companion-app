import '../../utils/convertors/date_time_to_str/convert_to_ymmmd.dart';
import '../../utils/convertors/date_time_to_str/convert_to_ymmmd_add_jms.dart';
import '../../utils/convertors/enum_to_str/convert_up_campus_enum_to_str.dart';
import '../../utils/convertors/str_to_enum/convert_up_campus_str_to_enum.dart';
import '../injection_container.dart';

void registerConvertorDependencies() {
  // Enum to String.
  sl.registerLazySingleton(() => const ConvertUPCampusEnumToStr());

  // String to Enum.
  sl.registerLazySingleton(() => const ConvertUPCampusStrToEnum());

  // DateTime to String.
  sl.registerLazySingleton(() => const ConvertToYMMMD());
  sl.registerLazySingleton(() => const ConvertToYMMMDAddJMS());
}
