import 'package:equatable/equatable.dart';

import '../../../domain/core/auth/entities/auth_status_entity.dart';
import '../../../utils/convertors/date_time_to_str/date_time_to_str.dart';

class AuthStatusState extends Equatable {
  const AuthStatusState._({
    required this.isLoggedIn,
    required this.lastUpdated,
  });

  final bool isLoggedIn;
  final String lastUpdated;

  factory AuthStatusState.fromEntity(AuthStatusEntity entity) {
    return AuthStatusState._(
      isLoggedIn: entity.isLoggedIn,
      lastUpdated: DateTimeToStr.convertToYMMMDAddJMS(entity.lastUpdated),
    );
  }

  @override
  List<Object> get props => [isLoggedIn, lastUpdated];
}
