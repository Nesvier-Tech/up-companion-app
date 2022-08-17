import 'package:equatable/equatable.dart';

abstract class FailureIntf<ParamType> extends Equatable {
  /// If the subclasses have some properties, they'll get passed to
  /// this constructor. so that [Equatable] can perform value comparison.
  const FailureIntf({required this.params});

  final ParamType params;

  @override
  List<Object> get props => [params as Object];
}

class Params extends Equatable {
  const Params({
    required this.errorCode,
    required this.errorMsg,
    required this.rootCause,
    this.error,
    this.stackTrace,
  });

  final String errorCode;
  final String errorMsg;
  final String rootCause;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [errorCode, errorMsg, error, stackTrace];
}
