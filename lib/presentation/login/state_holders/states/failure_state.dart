import 'package:equatable/equatable.dart';

import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/params/failure_base_params.dart';

class FailureState extends Equatable {
  const FailureState._({
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
  final String? errorObj;
  final String? stackTrace;

  factory FailureState.fromFailure(FailureIntf<FailureBaseParams> failure) {
    late final FailureBaseParams params;
    late final String otherDetails;
    late final String errorObj;
    late final String stackTrace;

    params = failure.params;
    otherDetails = params.otherDetails ?? 'No other details.';
    errorObj = params.errorObj != null
        ? params.errorObj.toString()
        : 'No error object.';
    stackTrace = params.stackTrace != null
        ? params.stackTrace.toString()
        : 'No stack trace.';

    return FailureState._(
      errorCode: params.errorCode,
      errorMsg: params.errorMsg,
      errorSource: params.errorSource,
      otherDetails: otherDetails,
      errorObj: errorObj,
      stackTrace: stackTrace,
    );
  }

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
