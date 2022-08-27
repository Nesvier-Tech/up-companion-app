import '../../constants/enums/up_campuses.dart';

class ConvertUPCampusStrToEnum {
  const ConvertUPCampusStrToEnum();

  UPCampuses call(String upCampus) {
    switch (upCampus) {
      case 'UP Baguio':
        return UPCampuses.upBaguio;
      case 'UP Cebu':
        return UPCampuses.upCebu;
      case 'UP Diliman':
        return UPCampuses.upDiliman;
      case 'UP Los Baños':
        return UPCampuses.upLosBanos;
      case 'UP Manila':
        return UPCampuses.upManila;
      case 'UP Mindanao':
        return UPCampuses.upMindanao;
      case 'UP Open University':
        return UPCampuses.upOpenUniversity;
      case 'UP Visayas':
        return UPCampuses.upVisayas;
      default:
        return UPCampuses.unknown;
    }
  }
}
