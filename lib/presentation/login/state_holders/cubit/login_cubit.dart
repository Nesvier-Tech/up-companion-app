// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../../../domain/core/network/use_cases/has_internet_connection.dart';
import '../../../../utils/constants/no_params.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/service_locators/injection_container.dart';
import 'state_params.dart';

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
    late final Either<FailureIntf<Params>, UserEntity> userEntity;

    emit(const LoginInitial());

    hasInternetConnection = await sl<HasInternetConnection>()();
    if (hasInternetConnection) {
      emit(const LoginLoadInProgress());
    }

    userEntity = await createUserWithEmailAndPasswordUseCase(
      email: email,
      password: password,
    );

    userEntity.fold((failure) {
      emit(LoginLoadFailure(
        params: FailureStateParams(
          errorCode: failure.params.errorCode,
          errorMsg: failure.params.errorMsg,
          rootCause: failure.params.rootCause,
        ),
      ));
    }, (userEntity) {
      emit(LoginLoadSuccess(
        params: SuccessStateParams(
          id: userEntity.id,
          username: userEntity.username,
          email: userEntity.email,
          upCampus: userEntity.upCampus,
          dateCreated: userEntity.dateCreated,
        ),
      ));
    });
  }
}
