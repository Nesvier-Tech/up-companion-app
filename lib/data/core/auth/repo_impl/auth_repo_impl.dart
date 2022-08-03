import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';

class AuthRepoImpl implements AuthRepoIntf {
  final FirebaseAuth firebaseAuth;

  const AuthRepoImpl({required this.firebaseAuth});

  @override
  Future<Either<FailureIntf, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late final UserCredential userCredential;

    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential);
    } catch (error) {
      print(error);

      return Left(FirebaseAuthFailure(properties: [error]));
    }
  }
}
