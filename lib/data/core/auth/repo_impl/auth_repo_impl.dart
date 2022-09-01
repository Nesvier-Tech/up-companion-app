import '../../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../../service_locator/injection_container.dart';
import 'create_user_with_email_and_password_repo_impl.dart';
import 'get_current_user_repo_impl.dart';
import 'listen_on_auth_state_changes_repo_impl.dart';

class AuthRepoImpl implements AuthRepoIntf {
  const AuthRepoImpl();

  @override
  FutureEitherUserEntity createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return sl.get<CreateUserWithEmailAndPasswordRepoImpl>()(
      email: email,
      password: password,
    );
  }

  @override
  EitherUserEntity getCurrentUser() {
    return sl.get<GetCurrentUserRepoImpl>()();
  }

  @override
  StreamEitherAuthStatusEntity listenOnAuthStateChanges() {
    return sl.get<ListenOnAuthStateChangesRepoImpl>()();
  }
}
