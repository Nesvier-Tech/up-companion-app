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
  const AuthStatusGetSuccess({required this.authStatusState});

  final state.AuthStatusState authStatusState;

  @override
  List<state.AuthStatusState> get props => [authStatusState];
}

class AuthStatusGetFailure extends AuthStatusState {
  const AuthStatusGetFailure({required this.failureState});

  final FailureState failureState;

  @override
  List<FailureState> get props => [failureState];
}
