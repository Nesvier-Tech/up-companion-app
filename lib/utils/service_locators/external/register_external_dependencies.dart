import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../injection_container.dart';

void registerExternalDependencies() {
  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Cloud Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Internet Connection Checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
