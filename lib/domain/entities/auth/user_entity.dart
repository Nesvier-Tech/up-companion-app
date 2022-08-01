import 'package:equatable/equatable.dart';

import '../../../utils/constants/gender.dart';
import '../../../utils/constants/religion.dart';

class UserEntity extends Equatable {
  final String? id;
  final String username;
  final String email;

  //* Basic User Information
  final String? lastName;
  final String? firstName;
  final String? middleName;
  final String? middleInitial;
  final DateTime? birthday;
  final int? age;
  final Gender? gender;
  final Religion? religion;
  final String? homeAddress;

  //* Basic University Information
  final String? studentNumber;
  final String? schoolEmail;
  final String? upCampus;
  final int? yearLevel;
  final int? noOfYearsInUP;
  final String? programOfStudy;

  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
    this.lastName,
    this.firstName,
    this.middleName,
    this.middleInitial,
    this.birthday,
    this.age,
    this.gender,
    this.religion,
    this.homeAddress,
    this.studentNumber,
    this.schoolEmail,
    this.upCampus,
    this.yearLevel,
    this.noOfYearsInUP,
    this.programOfStudy,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        lastName,
        firstName,
        middleName,
        middleInitial,
        birthday,
        age,
        gender,
        religion,
        homeAddress,
        studentNumber,
        schoolEmail,
        upCampus,
        yearLevel,
        noOfYearsInUP,
        programOfStudy,
      ];
}
