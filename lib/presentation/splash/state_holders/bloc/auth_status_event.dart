part of 'auth_status_bloc.dart';

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();
}

class AuthStatusStarted extends AuthStatusEvent {
  const AuthStatusStarted();

  @override
  List<Object> get props => const [];
}

class AuthStatusListenerLoggedIn extends AuthStatusEvent {
  const AuthStatusListenerLoggedIn({required this.authStatusEntity});

  final AuthStatusEntity authStatusEntity;

  @override
  List<AuthStatusEntity> get props => [authStatusEntity];
}

class AuthStatusListenerSignedOut extends AuthStatusEvent {
  const AuthStatusListenerSignedOut();

  @override
  List<Object> get props => const [];
}

class AuthStatusListenerErrored extends AuthStatusEvent {
  const AuthStatusListenerErrored({required this.failure});

  final FirebaseAuthFailure failure;

  @override
  List<FirebaseAuthFailure> get props => [failure];
}
