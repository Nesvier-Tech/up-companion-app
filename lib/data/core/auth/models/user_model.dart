import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../utils/constants/enums/up_campuses.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String username,
    required String email,
    required UPCampuses upCampus,
    required DateTime dateCreated,
  }) : super(
          id: id,
          username: username,
          email: email,
          upCampus: upCampus,
          dateCreated: dateCreated,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      upCampus: json['upCampus'],
      dateCreated: json['dateCreated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'upCampus': upCampus.toString(),
      'dateCreated': Timestamp.fromDate(dateCreated),
    };
  }

  factory UserModel.formSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.id,
      username: 'null',
      email: 'null',
      upCampus: UPCampuses.upDiliman,
      dateCreated: DateTime.now(),
    );
  }
}
