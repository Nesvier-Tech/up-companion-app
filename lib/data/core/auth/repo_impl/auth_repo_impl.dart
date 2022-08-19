import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:up_companion_app/data/core/auth/models/user_model.dart';
import 'package:up_companion_app/domain/core/auth/entities/user_entity.dart';

import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/constants/up_campuses.dart';
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
  Future<Either<FailureIntf<Params>, UserEntity>>
      createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late final UserCredential userCredential;
    late final User? user;
    late final UserEntity userEntity;
    late final UserModel userModel;
    late final Either<FailureIntf<Params>, UserEntity> returnValue;
    late final Either<FailureIntf<Params>, void> response;

    try {
      // Try to create the user account.
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Build the user model.
      user = userCredential.user;
      userModel = UserModel(
        id: user?.uid ?? 'null',
        username: user?.displayName ?? 'null',
        email: user?.email ?? 'null',
        upCampus: UPCampuses.upDiliman,
        dateCreated: DateTime.now(),
      );

      // Save the other user account details on the database.
      response = await _addNewUserData(userModel: userModel);
      response.fold(
        (firebaseFirestoreFailure) =>
            returnValue = Left(firebaseFirestoreFailure),
        (_) {
          // Build the user entity if saving the other user data in the
          // database was successful.
          userEntity = UserEntity(
            id: user?.uid ?? 'null',
            username: user?.displayName ?? 'null',
            email: user?.email ?? 'null',
            upCampus: UPCampuses.upDiliman,
            dateCreated: DateTime.now(),
          );

          returnValue = Right(userEntity);
        },
      );

      return returnValue;
    } on FirebaseAuthException catch (error) {
      // Utilizing FirebaseAuth's built-in exception.
      return Left(
        FirebaseAuthFailure(
            errorCode: error.code,
            errorMsg: error.message ?? 'null',
            rootCause: 'Firebase Auth'),
      );
    } catch (error, stackTrace) {
      // For unknown firebase auth exceptions.
      // 'The 500 status code, or Internal Server Error, means that server
      // cannot process the request for an unknown reason.' - (see Ref.)
      // Ref: https://www.digitalocean.com/community/tutorials/how-to-troubleshoot-common-http-error-codes
      return Left(FirebaseAuthFailure(
        errorCode: '500',
        errorMsg: 'An unknown error has occurred.',
        error: error,
        rootCause: 'Firebase Auth',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Either<FailureIntf, UserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  Future<Either<FailureIntf<Params>, void>> _addNewUserData({
    required UserModel userModel,
  }) async {
    late final FirebaseFirestore db;
    late final CollectionReference<Map<String, dynamic>> userCollection;

    // Get the 'users' database collection reference.
    db = firebaseFirestore;
    userCollection = db.collection('users');

    try {
      // Try to add the user data to the database.
      await userCollection.doc(userModel.id).set(userModel.toJson());

      // ignore: void_checks
      return const Right(VoidCallback);
    } catch (error, stackTrace) {
      return Left(FirebaseFirestoreFailure(
        errorCode: '500',
        errorMsg: 'An unknown error has occurred. ($error)\n$stackTrace',
        rootCause: 'Firebase Firestore',
        error: error,
        stackTrace: stackTrace,
      ));
    }
  }
}
