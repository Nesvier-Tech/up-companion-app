// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:up_companion_app/presentation/core/states/failure_state.dart';
import 'package:up_companion_app/presentation/login/state_holders/states/user_state.dart';

import '../../../../domain/core/auth/entities/user_entity.dart';
import '../../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../../../domain/core/network/use_cases/has_internet_connection.dart';
import '../../../../service_locator/injection_container.dart';
import '../../../../utils/failures/failure_intf.dart';
import '../../../../utils/params/failure_base_params.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.createUserWithEmailAndPassword,
  }) : super(const LoginInitial());

  final CreateUserWithEmailAndPassword createUserWithEmailAndPassword;

  void loginUser({
    required String email,
    required String password,
  }) async {
    late final bool hasInternetConnection;
    late final Either<FailureIntf<FailureBaseParams>, UserEntity>
        eitherUserEntity;

    // Initial state.
    emit(const LoginInitial());

    // In-Progress state.
    hasInternetConnection = await sl<HasInternetConnection>()();
    if (hasInternetConnection) {
      emit(const LoginLoadInProgress());
    }

    // Try creating the user account.
    eitherUserEntity = await createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Determine if Success or Failure.
    eitherUserEntity.fold((failure) {
      emit(LoginLoadFailure(
        failureState: FailureState.fromFailure(failure),
      ));
    }, (userEntity) {
      emit(LoginLoadSuccess(
        userState: UserState.fromEntity(userEntity),
      ));
    });
  }
}
