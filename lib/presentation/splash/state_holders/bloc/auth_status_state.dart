part of 'auth_status_bloc.dart';

abstract class AuthStatusState extends Equatable {
  const AuthStatusState();
}

class AuthStatusInitial extends AuthStatusState {
  const AuthStatusInitial();

  @override
  List<Object> get props => const [];
}

class AuthStatusGetInProgress extends AuthStatusState {
  const AuthStatusGetInProgress();

  @override
  List<Object> get props => const [];
}

class AuthStatusGetSuccess extends AuthStatusState {
  const AuthStatusGetSuccess({required this.authStatusEntity});

  final AuthStatusEntity authStatusEntity;

  @override
  List<AuthStatusEntity> get props => [authStatusEntity];
}
