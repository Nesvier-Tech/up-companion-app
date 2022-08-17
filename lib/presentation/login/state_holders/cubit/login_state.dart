part of 'login_cubit.dart';

abstract class LoginState<ParamType> extends Equatable {
  const LoginState({required this.params});

  final ParamType params;

  @override
  List<Object> get props => [params as Object];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(params: const NoParams());
}

class LoginLoadInProgress extends LoginState {
  const LoginLoadInProgress() : super(params: const NoParams());
}

class LoginLoadSuccess extends LoginState<SuccessStateParams> {
  const LoginLoadSuccess({
    required SuccessStateParams params,
  }) : super(params: params);
}

class LoginLoadFailure extends LoginState<FailureStateParams> {
  const LoginLoadFailure({
    required FailureStateParams params,
  }) : super(params: params);
}
