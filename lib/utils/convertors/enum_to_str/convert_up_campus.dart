import '../../constants/up_campuses.dart';

class ConvertUPCampus {
  const ConvertUPCampus();

  String call(UPCampuses upCampus) {
    switch (upCampus) {
      case UPCampuses.upBaguio:
        return 'UP Baguio';
      case UPCampuses.upCebu:
        return 'UP Cebu';
      case UPCampuses.upDiliman:
        return 'UP Diliman';
      case UPCampuses.upLosBanos:
        return 'UP Los Baños';
      case UPCampuses.upManila:
        return 'UP Manila';
      case UPCampuses.upMindanao:
        return 'UP Mindanao';
      case UPCampuses.upOpenUniversity:
        return 'UP Open University';
      case UPCampuses.upVisayas:
        return 'UP Visayas';
      default:
        return 'Unknown UP Campus';
    }
  }
}
