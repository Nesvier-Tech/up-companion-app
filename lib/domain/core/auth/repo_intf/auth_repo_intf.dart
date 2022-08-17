import 'package:dartz/dartz.dart';

import '../../../../utils/failures/failure_intf.dart';
import '../entities/user_entity.dart';

abstract class AuthRepoIntf {
  const AuthRepoIntf();

  Future<Either<FailureIntf<Params>, UserEntity>>
      createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Either<FailureIntf, UserEntity> getCurrentUser();
}
