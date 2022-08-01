import 'package:dartz/dartz.dart';

import '../../../../utils/failures/failure_intf.dart';

abstract class AuthRepoIntf {
  const AuthRepoIntf();

  Future<Either<FailureIntf, Null>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
