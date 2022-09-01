import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/core/auth/entities/auth_status_entity.dart';
import '../../../../utils/failures/firebase_auth_failure.dart';
import '../../../core/states/failure_state.dart';
import '../../states/auth_status_state.dart' as state;

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc() : super(const AuthStatusInitial()) {
    print('AuthStatusBlocInit');

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

    on<AuthStatusListenerSignedOut>(
      (event, emit) {
        print('SignedOut event received.');
      },
    );

    on<AuthStatusListenerErrored>(
      (event, emit) {},
    );
  }
}
