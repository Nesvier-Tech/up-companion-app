// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/core/auth/entities/auth_status_entity.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc() : super(const AuthStatusInitial()) {
    on<AuthStatusStarted>((event, emit) {
      print('AuthStatusStarted');
    });

    on<AuthStatusListenerLoggedIn>(
      (event, emit) {
        print('AuthStatusListenerLoggedIn');

        emit(const AuthStatusInitial());
        emit(const AuthStatusGetInProgress());
      },
    );
  }
}
