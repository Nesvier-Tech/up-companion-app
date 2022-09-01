import '../../presentation/splash/state_holders/bloc/auth_status_bloc.dart';
import '../injection_container.dart';

void registerSplashDependencies() {
  // Bloc
  sl.registerLazySingleton(() => AuthStatusBloc());
  print('AuthStatusBloc registered.');
}
