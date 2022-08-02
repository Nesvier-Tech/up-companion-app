part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final List<Object> properties;

  const LoginState({this.properties = const <Object>[]});

  @override
  List<Object> get props => [properties];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoadInProgress extends LoginState {
  const LoginLoadInProgress();
}

class LoginLoadSuccess extends LoginState {
  LoginLoadSuccess({
    required UserCredential userCredential,
  }) : super(properties: [userCredential]);
}

class LoginLoadFailure extends LoginState {
  LoginLoadFailure({
    required FailureIntf failure,
  }) : super(properties: [failure]);
}
