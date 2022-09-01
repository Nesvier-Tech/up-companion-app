import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/params/failure_base_params.dart';
import '../entities/auth_status_entity.dart';
import '../entities/user_entity.dart';

typedef FutureEitherUserEntity
    = Future<Either<FailureIntf<FailureBaseParams>, UserEntity>>;
typedef EitherUserEntity = Either<FailureIntf<FailureBaseParams>, UserEntity>;
typedef EitherAuthStatusEntity
    = Either<FailureIntf<FailureBaseParams>, AuthStatusEntity>;
typedef StreamEitherAuthStatusEntity = Stream<EitherAuthStatusEntity>;

abstract class AuthRepoIntf {
  const AuthRepoIntf();

  FutureEitherUserEntity createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  EitherUserEntity getCurrentUser();

  StreamEitherAuthStatusEntity listenOnAuthStateChanges();
}
