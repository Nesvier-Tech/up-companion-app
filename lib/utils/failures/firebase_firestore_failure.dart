import '../params/failure_base_params.dart';
import 'failure_intf.dart';

class FirebaseFirestoreFailure extends FailureIntf<FailureBaseParams> {
  FirebaseFirestoreFailure({
    required String errorCode,
    required String errorMsg,
    required String errorSource,
    String? otherDetails,
    Object? errorObj,
    StackTrace? stackTrace,
  }) : super(
          params: FailureBaseParams(
            errorCode: errorCode,
            errorMsg: errorMsg,
            errorSource: errorSource,
            otherDetails: otherDetails,
            errorObj: errorObj,
            stackTrace: stackTrace,
          ),
        );
}
