import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/constants/enums/up_campuses.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';
import '../../../../utils/failures/firebase_firestore_failure.dart';
import '../../../../utils/params/failure_base_params.dart';
import '../models/user_model.dart';

typedef FutureEitherVoid = Future<Either<FailureIntf<FailureBaseParams>, void>>;

class CreateUserWithEmailAndPasswordRepoImpl {
  const CreateUserWithEmailAndPasswordRepoImpl({
    required this.authProvider,
    required this.dbProvider,
  });

  final FirebaseAuth authProvider;
  final FirebaseFirestore dbProvider;

  FutureEitherUserEntity call({
    required String email,
    required String password,
  }) async {
    late final UserCredential userCredential;
    late final User? user;
    late final UserEntity userEntity;
    late final UserModel userModel;
    late final Either<FailureIntf<FailureBaseParams>, UserEntity> returnValue;
    late final Either<FailureIntf<FailureBaseParams>, void> response;

    try {
      // Try to create the user account.
      userCredential = await authProvider.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Build the [UserModel].
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
          // Build the [UserEntity] if saving the other user data in the
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
          errorSource: 'Firebase Auth',
        ),
      );
    } catch (error, stackTrace) {
      // For unknown firebase auth exceptions.
      // 'The 500 status code, or Internal Server Error, means that server
      // cannot process the request for an unknown reason.' - (see Ref.)
      // Ref: https://www.digitalocean.com/community/tutorials/how-to-troubleshoot-common-http-error-codes
      return Left(FirebaseAuthFailure(
        errorCode: '500',
        errorMsg: 'An unknown error has occurred.',
        errorSource: 'Firebase Auth',
        otherDetails: error.toString(),
        errorObj: error,
        stackTrace: stackTrace,
      ));
    }
  }

  //* Utility function.
  FutureEitherVoid _addNewUserData({
    required UserModel userModel,
  }) async {
    late final CollectionReference<Map<String, dynamic>> userCollection;

    // Get the 'users' database collection reference.
    userCollection = dbProvider.collection('users');

    try {
      // Try to add the user data to the database.
      await userCollection.doc(userModel.id).set(userModel.toJson());

      // ignore: void_checks
      return const Right(VoidCallback);
    } catch (error, stackTrace) {
      return Left(FirebaseFirestoreFailure(
        errorCode: '500',
        errorMsg: 'An unknown error has occurred.',
        errorSource: 'Firebase Firestore',
        otherDetails: error.toString(),
        errorObj: error,
        stackTrace: stackTrace,
      ));
    }
  }
}
