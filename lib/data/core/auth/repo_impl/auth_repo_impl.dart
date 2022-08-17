import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:up_companion_app/utils/constants/up_campuses.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';
import '../../../../utils/failures/firebase_firestore_failure.dart';

class AuthRepoImpl implements AuthRepoIntf {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const AuthRepoImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<Either<FailureIntf, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late final UserCredential userCredential;
    late final User? user;
    late final UserEntity userEntity;
    late final Either<FailureIntf, UserEntity> returnValue;
    late final Either<FailureIntf, void> response;

    try {
      // Try to create the user account.
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Build the user entity.
      user = userCredential.user;
      userEntity = UserEntity(
        id: user?.uid ?? 'null',
        username: user?.displayName ?? 'null',
        email: user?.email ?? 'null',
        upCampus: UPCampuses.upDiliman,
        dateCreated: DateTime.now(),
      );

      // Save the other user account details on the database.
      response = await _addNewUserData(userEntity: userEntity);
      response.fold(
        (firebaseFirestoreFailure) =>
            returnValue = Left(firebaseFirestoreFailure),
        (_) => returnValue = Right(userEntity),
      );

      return returnValue;
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(
        properties: {
          'code': error.code,
          'message': error.message,
        },
      ));
    } catch (error) {
      // For unknown firebase auth exceptions.
      return Left(FirebaseAuthFailure(
        properties: {'raw-error': error.toString()},
      ));
    }
  }

  @override
  Either<FailureIntf, UserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  Future<Either<FailureIntf, void>> _addNewUserData({
    required UserEntity userEntity,
  }) async {
    final db = firebaseFirestore;
    final CollectionReference<Map<String, dynamic>> userCollection =
        db.collection('users');

    try {
      await userCollection.doc(userEntity.id).set(userEntity.toJson());

      // ignore: void_checks
      return const Right(VoidCallback);
    } catch (error, stackTrace) {
      return const Left(FirebaseFirestoreFailure());
    }
  }
}
