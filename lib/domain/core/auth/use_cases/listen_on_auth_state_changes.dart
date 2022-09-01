import 'dart:async';

import '../../../../presentation/splash/state_holders/bloc/auth_status_bloc.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';
import '../repo_intf/auth_repo_intf.dart';

class ListenOnAuthStateChanges {
  const ListenOnAuthStateChanges({
    required this.authRepo,
    required this.authStatusBloc,
  });

  final AuthRepoIntf authRepo;
  final AuthStatusBloc authStatusBloc;

  StreamEitherAuthStatusEntity call() {
    late final StreamEitherAuthStatusEntity stream;
    late final StreamSubscription<EitherAuthStatusEntity> subscription;

    stream = authRepo.listenOnAuthStateChanges();
    subscription = stream.listen(
      (event) {
        print(event);

        event.fold(
          (_) {},
          (authStatusEntity) {
            if (authStatusEntity.isLoggedIn) {
              authStatusBloc.add(AuthStatusListenerLoggedIn(
                authStatusEntity: authStatusEntity,
              ));
            } else {
              authStatusBloc.add(const AuthStatusListenerSignedOut());
            }
          },
        );
      },
      onError: (error, stackTrace) {
        print('$error\n$stackTrace');

        (error as EitherAuthStatusEntity).fold(
          (failure) {
            authStatusBloc.add(AuthStatusListenerErrored(
              failure: failure as FirebaseAuthFailure,
            ));
          },
          (_) {},
        );
      },
      onDone: () => subscription.cancel(),
      cancelOnError: false,
    );

    throw UnimplementedError();
  }
}
