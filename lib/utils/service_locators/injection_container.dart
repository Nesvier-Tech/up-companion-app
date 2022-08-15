import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/core/auth/repo_impl/auth_repo_impl.dart';
import '../../data/core/network/repo_impl/network_repo_impl.dart';
import '../../domain/core/auth/repo_intf/auth_repo_intf.dart';
import '../../domain/core/auth/use_cases/create_user_with_email_and_password.dart';
import '../../domain/core/network/repo_intf/network_repo_intf.dart';
import '../../domain/core/network/use_cases/has_internet_connection.dart';
import '../../presentation/login/state_holders/cubit/login_cubit.dart';

final getIt = GetIt.instance;

void init() {
  //* Core - Network
  // Use Cases
  getIt.registerLazySingleton(
    () => HasInternetConnection(networkRepoIntf: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<NetworkRepoIntf>(
    () => NetworkRepoImpl(internetConnectionChecker: getIt()),
  );

  //* Core - Auth
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

  // Cloud Firestore
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // Internet Connection Checker
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
