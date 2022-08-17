import 'package:equatable/equatable.dart';

import '../../../../utils/constants/up_campuses.dart';

abstract class StateParams extends Equatable {
  const StateParams();
}

class SuccessStateParams extends StateParams {
  const SuccessStateParams({
    required this.id,
    required this.username,
    required this.email,
    required this.upCampus,
    required this.dateCreated,
  });

  final String id;
  final String username;
  final String email;
  final UPCampuses upCampus;
  final DateTime dateCreated;

  @override
  List<Object> get props => [id, username, email, upCampus, dateCreated];
}

class FailureStateParams extends StateParams {
  const FailureStateParams({
    required this.errorCode,
    required this.errorMsg,
    required this.rootCause,
  });

  final String errorCode;
  final String errorMsg;
  final String rootCause;

  @override
  List<Object> get props => [errorCode, errorMsg, rootCause];
}
