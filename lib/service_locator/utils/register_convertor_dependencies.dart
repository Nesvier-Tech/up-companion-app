import '../../utils/convertors/date_time_to_str/convert_to_ymmmd.dart';
import '../../utils/convertors/enum_to_str/convert_up_campus.dart';
import '../injection_container.dart';

void registerConvertorDependencies() {
  // Enum to String.
  sl.registerLazySingleton(() => const ConvertUPCampus());

  // DateTime to String.
  sl.registerLazySingleton(() => const ConvertToYMMMD());
}
