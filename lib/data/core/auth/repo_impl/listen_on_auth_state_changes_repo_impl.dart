import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/entities/auth_status_entity.dart';
import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';

class ListenOnAuthStateChangesRepoImpl {
  const ListenOnAuthStateChangesRepoImpl({required this.authProvider});

  final FirebaseAuth authProvider;

  StreamEitherAuthStatusEntity call() {
    final Stream<User?> stream = authProvider.authStateChanges();
    late final StreamController<EitherAuthStatusEntity> controller;
    late final StreamSubscription<User?> subscription;

    controller = StreamController(
      onListen: () {},
      onPause: () {},
      onResume: () {},
      onCancel: () {
        print('AuthStatus stream closed.');
      },
    );

    subscription = stream.listen(
      (User? event) {
        late final AuthStatusEntity authStatusEntity;

        authStatusEntity = AuthStatusEntity(
          isLoggedIn: event != null ? true : false,
          lastUpdated: DateTime.now(),
        );

        controller.add(Right(authStatusEntity));
      },
      onError: (error, stackStrace) {
        late final FirebaseAuthFailure failure;

        failure = FirebaseAuthFailure(
          errorCode: '500',
          errorMsg: 'There was an error while listening on Auth State Changes.',
          errorSource: 'FirebaseAuth',
          otherDetails: error.toString(),
          errorObj: error,
          stackTrace: stackStrace,
        );

        controller.addError(Left(failure));
      },
      onDone: () {
        controller.close();
        subscription.cancel();
      },
      cancelOnError: false,
    );

    return controller.stream;
  }
}
