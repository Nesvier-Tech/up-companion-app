import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/login/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';
import '../../../../utils/service_locators/injection_container.dart';

class AuthRepoImpl implements AuthRepoIntf {
  const AuthRepoImpl();

  @override
  Future<Either<FailureIntf, Null>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late final FirebaseAuth firebaseAuth;
    late final UserCredential userCredential;

    try {
      firebaseAuth = getIt<FirebaseAuth>();
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return const Right(null);
    } catch (e) {
      print(e);

      return const Left(FirebaseAuthFailure());
    }
  }
}
