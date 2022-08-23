part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => const [];
}

class LoginLoadInProgress extends LoginState {
  const LoginLoadInProgress();

  @override
  List<Object> get props => const [];
}

class LoginLoadSuccess extends LoginState {
  const LoginLoadSuccess({required this.userState});

  final UserState userState;

  @override
  List<Object> get props => [userState];
}

class LoginLoadFailure extends LoginState {
  const LoginLoadFailure({required this.failureState});

  final FailureState failureState;

  @override
  List<Object> get props => [failureState];
}
