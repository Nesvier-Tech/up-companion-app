import '../../../data/core/auth/repo_impl/auth_repo_impl.dart';
import '../../../data/core/auth/repo_impl/create_user_with_email_and_password_repo_impl.dart';
import '../../../data/core/auth/repo_impl/get_current_user_repo_impl.dart';
import '../../../data/core/auth/repo_impl/listen_on_auth_state_changes_repo_impl.dart';
import '../../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../injection_container.dart';

void registerAuthDependencies() {
  // Use cases
  sl.registerLazySingleton(
    () => CreateUserWithEmailAndPassword(authRepo: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepoIntf>(
    () => const AuthRepoImpl(),
  );

  sl.registerLazySingleton(
    () => CreateUserWithEmailAndPasswordRepoImpl(
      authProvider: sl(),
      dbProvider: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetCurrentUserRepoImpl(authProvider: sl()));

  sl.registerLazySingleton(
    () => ListenOnAuthStateChangesRepoImpl(authProvider: sl()),
  );
}
