import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../data/core/auth/repo_impl/auth_repo_impl.dart';
import '../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../presentation/login/state_holders/cubit/login_cubit.dart';

final getIt = GetIt.instance;

void init() {
  //* Features - Login
  // Blocs
  getIt.registerFactory(
    () => LoginCubit(createUserWithEmailAndPasswordUseCase: getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => CreateUserWithEmailAndPassword(authRepo: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepoIntf>(
    () => AuthRepoImpl(firebaseAuth: getIt()),
  );

  //* External
  // Firebase Auth
  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerLazySingleton(() => firebaseAuth);
}
