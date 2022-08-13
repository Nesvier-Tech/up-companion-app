part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final Map<String, dynamic> properties;

  const LoginState({this.properties = const <String, dynamic>{}});

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
    required UserEntity userEntity,
  }) : super(properties: {'user-entity': userEntity});
}

class LoginLoadFailure extends LoginState {
  LoginLoadFailure({
    required FailureIntf failure,
  }) : super(properties: {'failure': failure});
}
