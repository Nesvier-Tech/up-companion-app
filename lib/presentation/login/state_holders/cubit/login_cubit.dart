// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../../../domain/core/network/use_cases/has_internet_connection.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/params/failure_base_params.dart';
import '../../../../utils/params/params_intf.dart';
import '../../../../utils/service_locators/injection_container.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.createUserWithEmailAndPasswordUseCase,
  }) : super(const LoginInitial());

  final CreateUserWithEmailAndPassword createUserWithEmailAndPasswordUseCase;

  void loginUser({
    required String email,
    required String password,
  }) async {
    late final bool hasInternetConnection;
    late final Either<FailureIntf<ParamsIntf>, UserEntity> eitherUserEntity;
    late final FailureBaseParams failureParams;

    // Initial state.
    emit(const LoginInitial());

    // In-Progress state.
    hasInternetConnection = await sl<HasInternetConnection>()();
    if (hasInternetConnection) {
      emit(const LoginLoadInProgress());
    }

    // Try creating the user account.
    eitherUserEntity = await createUserWithEmailAndPasswordUseCase(
      email: email,
      password: password,
    );

    // Determine if Success of Failure.
    eitherUserEntity.fold((failure) {
      failureParams = failure.params as FailureBaseParams;
      emit(LoginLoadFailure(
        errorCode: failureParams.errorCode,
        errorMsg: failureParams.errorMsg,
        errorSource: failureParams.errorSource,
        otherDetails: failureParams.otherDetails,
        errorObj: failureParams.errorObj,
        stackTrace: failureParams.stackTrace,
      ));
    }, (userEntity) {
      emit(LoginLoadSuccess(
        id: userEntity.id,
        username: userEntity.username,
        email: userEntity.email,
        upCampus: userEntity.upCampus.toString(),
        dateCreated: userEntity.dateCreated.toString(),
      ));
    });
  }
}
