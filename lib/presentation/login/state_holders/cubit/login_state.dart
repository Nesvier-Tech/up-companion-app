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
  const LoginLoadSuccess({
    required this.id,
    required this.username,
    required this.email,
    required this.upCampus,
    required this.dateCreated,
  });

  final String id;
  final String username;
  final String email;
  final String upCampus;
  final String dateCreated;

  @override
  List<Object?> get props => [id, username, email, upCampus, dateCreated];
}

class LoginLoadFailure extends LoginState {
  const LoginLoadFailure({
    required this.errorCode,
    required this.errorMsg,
    required this.errorSource,
    this.otherDetails,
    this.errorObj,
    this.stackTrace,
  });

  final String errorCode;
  final String errorMsg;
  final String errorSource;
  final String? otherDetails;
  final Object? errorObj;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [
        errorCode,
        errorMsg,
        errorSource,
        otherDetails,
        errorObj,
        stackTrace,
      ];
}
