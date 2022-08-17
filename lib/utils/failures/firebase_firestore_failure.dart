import 'failure_intf.dart';

class FirebaseFirestoreFailure extends FailureIntf<Params> {
  FirebaseFirestoreFailure({
    required String errorCode,
    required String errorMsg,
    required String rootCause,
    Object? error,
    StackTrace? stackTrace,
  }) : super(
          params: Params(
            errorCode: errorCode,
            errorMsg: errorMsg,
            rootCause: rootCause,
            error: error,
            stackTrace: stackTrace,
          ),
        );
}
