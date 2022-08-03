// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../../../utils/failures/failure_intf.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CreateUserWithEmailAndPassword createUserWithEmailAndPasswordUseCase;

  LoginCubit({
    required this.createUserWithEmailAndPasswordUseCase,
  }) : super(const LoginInitial());

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(const LoginInitial());
    emit(const LoginLoadInProgress());

    final Either<FailureIntf, UserCredential> userCredential =
        await createUserWithEmailAndPasswordUseCase(
      email: email,
      password: password,
    );

    userCredential.fold((firebaseAuthFailure) {
      emit(LoginLoadFailure(failure: firebaseAuthFailure));
    }, (userCredential) {
      emit(LoginLoadSuccess(userCredential: userCredential));
    });
  }
}
