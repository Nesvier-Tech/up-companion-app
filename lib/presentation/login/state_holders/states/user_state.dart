import 'package:equatable/equatable.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../utils/convertors/date_time_to_str/date_time_to_str.dart';
import '../../../../utils/convertors/enum_to_str/enum_to_str.dart';

class UserState extends Equatable {
  const UserState._({
    required this.id,
    required this.username,
    required this.email,
    required this.upCampus,
    required this.dateCreated,
  });

  final String id;
  final String username;
  final String email;
  final String upCampus;
  final String dateCreated;

  factory UserState.fromEntity(UserEntity userEntity) {
    return UserState._(
      id: userEntity.id,
      username: userEntity.username,
      email: userEntity.email,
      upCampus: EnumToStr.convertUPCampus(userEntity.upCampus),
      dateCreated: DateTimeToStr.convertToYMMMD(userEntity.dateCreated),
    );
  }

  @override
  List<Object?> get props => [id, username, email, upCampus, dateCreated];
}
