import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
  });

  final String id;
  final String username;
  final String email;

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      username: json['username'],
      email: json['email'],
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
      username: 'test',
      email: '',
    );
  }

  @override
  List<Object?> get props => [id, username, email];
}
