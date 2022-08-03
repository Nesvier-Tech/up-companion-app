import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/failures/failure_intf.dart';

abstract class AuthRepoIntf {
  const AuthRepoIntf();

  Future<Either<FailureIntf, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
