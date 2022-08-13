import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';

class AuthRepoImpl implements AuthRepoIntf {
  final FirebaseAuth firebaseAuth;

  const AuthRepoImpl({required this.firebaseAuth});

  @override
  Future<Either<FailureIntf, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late final UserCredential userCredential;
    late final User? user;
    late final UserEntity userEntity;

    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      userEntity = UserEntity(
        id: user?.uid,
        username: user?.displayName ?? 'null',
        email: user?.email ?? 'null',
      );

      return Right(userEntity);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(
        properties: {
          'code': error.code,
          'message': error.message,
        },
      ));
    } catch (error) {
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
}
