import 'package:equatable/equatable.dart';

import '../../../../utils/constants/enums/up_campuses.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.upCampus,
    required this.dateCreated,
  });

  final String id;
  final String username;
  final String email;
  final UPCampuses upCampus;
  final DateTime dateCreated;

  @override
  List<Object?> get props => [id, username, email, upCampus, dateCreated];
}
