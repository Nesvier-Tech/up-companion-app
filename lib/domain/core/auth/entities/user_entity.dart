import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/constants/up_campuses.dart';

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

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
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
    };
  }

  factory UserEntity.formSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return UserEntity(
      id: snapshot.id,
      username: 'null',
      email: 'null',
      upCampus: UPCampuses.upDiliman,
      dateCreated: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [id, username, email, upCampus, dateCreated];
}
