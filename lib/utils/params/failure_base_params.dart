import 'params_intf.dart';

class FailureBaseParams extends ParamsIntf {
  const FailureBaseParams({
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
        errorObj,
        errorCode,
        errorMsg,
        errorSource,
        otherDetails,
        stackTrace,
      ];
}
