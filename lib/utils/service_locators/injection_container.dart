import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  //* Firebase Auth
  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerLazySingleton(() => firebaseAuth);
}
