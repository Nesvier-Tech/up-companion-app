// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:up_companion_app/domain/core/auth/entities/user_entity.dart';
import 'package:up_companion_app/domain/core/network/use_cases/has_internet_connection.dart';
import 'package:up_companion_app/utils/service_locators/injection_container.dart';

import '../../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../../../utils/failures/failure_intf.dart';

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
    late final Either<FailureIntf, UserEntity> userEntity;

    emit(const LoginInitial());

    hasInternetConnection = await sl<HasInternetConnection>()();
    if (hasInternetConnection) {
      emit(const LoginLoadInProgress());
    }

    userEntity = await createUserWithEmailAndPasswordUseCase(
      email: email,
      password: password,
    );

    userEntity.fold((firebaseAuthFailure) {
      emit(LoginLoadFailure(failure: firebaseAuthFailure));
    }, (userEntity) {
      emit(LoginLoadSuccess(userEntity: userEntity));
    });
  }
}
