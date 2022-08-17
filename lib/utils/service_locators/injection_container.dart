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

final sl = GetIt.instance;

void init() {
  //* Core - Network
  // Use Cases
  sl.registerLazySingleton(
    () => HasInternetConnection(networkRepoIntf: sl()),
  );

  // Repositories
  sl.registerLazySingleton<NetworkRepoIntf>(
    () => NetworkRepoImpl(internetConnectionChecker: sl()),
  );

  //* Core - Auth
  // Blocs
  sl.registerFactory(
    () => LoginCubit(createUserWithEmailAndPasswordUseCase: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => CreateUserWithEmailAndPassword(authRepo: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepoIntf>(
    () => AuthRepoImpl(
      firebaseAuth: sl(),
      firebaseFirestore: sl(),
    ),
  );

  //* External
  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Cloud Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Internet Connection Checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
